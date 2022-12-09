import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jajan_id/components/chat/convo.dart';
import 'package:jajan_id/models/chat.dart';
import 'package:jajan_id/req.dart';
import 'package:provider/provider.dart';

import '../../components/drawer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.channel,
    required this.isSeller,
  });

  final Channel channel;
  final bool isSeller;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool showLoadMoreBtn = false;
  List<ChatMessage> messages = [];
  bool initialLoad = true;
  ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final msgController = TextEditingController();
  late Timer refreshTimer;

  @override
  void initState() {
    super.initState();

    refreshTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int lastId = -1;
      if (messages.isNotEmpty) {
        lastId = messages.last.pk;
      }

      getMessages(null, lastId).then((data) {
        setState(() {
          messages = [...messages, ...data];
        });
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var newMessages = await getMessages(null, null);
      setState(() {
        messages = newMessages;
        initialLoad = false;
        showLoadMoreBtn = messages.length == 50;
      });
    });
  }

  void onLoadMore() {
    getMessages(messages[0].pk, null).then((data) {
      setState(() {
        messages = [...data, ...messages];
        showLoadMoreBtn = data.length == 50;
      });
    });
  }

  Future<List<ChatMessage>> getMessages(int? beforeId, int? afterId) async {
    String reqUrl = "chat/messages/${widget.channel.id}?";
    Map<String, String> params = {};

    if (beforeId != null) {
      params["before"] = beforeId.toString();
    }

    if (afterId != null) {
      params["after"] = afterId.toString();
    }

    String queryString = Uri(queryParameters: params).query;

    var req = context.read<AppRequest>();
    List<dynamic> data = await req.get("$reqUrl$queryString");
    return data.map((e) {
      return ChatMessage.fromJson(e["pk"], e["fields"]);
    }).toList();
  }

  @override
  void dispose() {
    refreshTimer.cancel();
    super.dispose();
  }

  void sendMessage() async {
    if (!formKey.currentState!.validate()) return;

    var req = context.read<AppRequest>();
    await req.postJson(
      "chat/messages/json/send",
      jsonEncode({
        "cid": widget.channel.id,
        "pesan": msgController.text,
      }),
    );

    int lastId = -1;
    if (messages.isNotEmpty) {
      lastId = messages.last.pk;
    }

    var data = await getMessages(null, lastId);
    setState(() {
      messages = [...messages, ...data];
      msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            initialLoad
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ConversationContainer(
                      messages: messages,
                      isSeller: widget.isSeller,
                      scrollController: scrollController,
                      showLoadingBtn: showLoadMoreBtn,
                      onLoadMoreClick: onLoadMore,
                    ),
                  ),
            Form(
              key: formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: msgController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Harap mengisi pesan";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Reply',
                        labelText: 'Reply',
                      ),
                      autofocus: false,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: sendMessage,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

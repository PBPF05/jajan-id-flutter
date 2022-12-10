import 'package:flutter/material.dart';
import 'package:jajan_id/components/chat/listing.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:jajan_id/models/chat.dart';
import 'package:jajan_id/req.dart';
import 'package:provider/provider.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late Future<ChannelData> chatsFuture;

  Future<ChannelData> fetchChats() async {
    var request = context.read<AppRequest>();
    Map<String, dynamic> res = await request.get("chat/get");
    return ChannelData.fromJson(res);
  }

  @override
  void initState() {
    super.initState();
    chatsFuture = fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: fetchChats,
        child: FutureBuilder(
          future: chatsFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading..."),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.warning,
                      color: Colors.yellow,
                      size: 30.0,
                    ),
                    Text("An error has occured")
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChatListing(data: snapshot.data!),
            );
          },
        ),
      ),
    );
  }
}

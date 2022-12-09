import 'package:flutter/material.dart';
import 'package:jajan_id/components/chat/listing.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:jajan_id/models/chat.dart';
import 'package:jajan_id/req.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<ChannelData> chatsFuture;

  Future<ChannelData> fetchChats(AppRequest request) async {
    Map<String, dynamic> res = await request.get("chat/get");
    return ChannelData.fromJson(res);
  }

  @override
  Widget build(BuildContext context) {
    final request = context.read<AppRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: fetchChats(request),
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
    );
  }
}

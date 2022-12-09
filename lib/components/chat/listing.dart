import 'package:flutter/material.dart';
import 'package:jajan_id/models/chat.dart';
import 'package:jajan_id/screens/home.dart';

class ChatListing extends StatelessWidget {
  const ChatListing({super.key, required this.data});

  final ChannelData data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: data.channels.length,
      itemBuilder: (context, index) {
        var chan = data.channels[index];
        String name;
        if (chan.isToko) {
          name = "${chan.user.firstName} ${chan.user.lastName}";
        } else {
          name = chan.toko.nama;
        }

        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyHomePage(title: "Home"),
                )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(data.chatMessages[chan.id.toString()]!)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jajan_id/models/chat.dart';

class ConversationContainer extends StatelessWidget {
  const ConversationContainer({
    super.key,
    required this.messages,
    required this.isSeller,
    required this.scrollController,
    required this.showLoadingBtn,
    required this.onLoadMoreClick,
  });

  final ScrollController scrollController;
  final List<ChatMessage> messages;
  final bool isSeller;
  final bool showLoadingBtn;
  final void Function() onLoadMoreClick;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        showLoadingBtn
            ? ElevatedButton(
                onPressed: onLoadMoreClick,
                child: const Text("Load More"),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        ...messages.map((msg) {
          final isMe = (msg.pengirim == "pengirim" && isSeller) ||
              (msg.pengirim == "user" && !isSeller);

          return Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Text(msg.pesan.trim()),
                ),
              ),
            ],
          );
        }).toList()
      ],
    );
  }
}

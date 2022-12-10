import 'package:flutter/material.dart';
import 'package:jajan_id/models/chat.dart';

class ConversationContainer extends StatefulWidget {
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
  State<ConversationContainer> createState() => _ConversationContainerState();
}

class _ConversationContainerState extends State<ConversationContainer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.scrollController.jumpTo(
        widget.scrollController.position.maxScrollExtent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        widget.showLoadingBtn
            ? ElevatedButton(
                onPressed: widget.onLoadMoreClick,
                child: const Text("Load More"),
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        ...widget.messages.map((msg) {
          final isMe = (msg.pengirim == "pengirim" && widget.isSeller) ||
              (msg.pengirim == "user" && !widget.isSeller);

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

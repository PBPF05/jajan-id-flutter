import 'package:flutter/material.dart';
import 'package:jajan_id/screens/detail_review/reviewform.dart';


class ReviewPage extends StatelessWidget {
   String? name, comment;
   ReviewPage({Key? key,required this.comment, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $name'),
            Text('Komentar: $comment'),
          ],
        ),
      ),
    ),
    );
  }
}

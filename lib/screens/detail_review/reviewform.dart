import 'package:flutter/material.dart';

import 'package:jajan_id/screens/detail_review/reviewpage.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key? key}) : super(key: key);

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  TextEditingController _name = TextEditingController();
  TextEditingController _comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kamu boleh berkomentar secara anon.'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _comment,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bagaimana pendapatmu?'
                ),
              ),
            ),
            ElevatedButton(onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReviewPage(name: _name.text, comment: _comment.text)));

            }, child: Text('Submit')),
            Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
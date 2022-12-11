import 'package:jajan_id/model/detailbarang_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jajan_id/screens/detail_review/reviewform.dart';
// import 'package:jajan_id/ReviewForm.dart';


// https://jajan-id.up.railway.app/katalog/json

class DetailPage extends StatefulWidget {
  // final int index;

  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
  // Future<String<DataDetail>> fetchDetailbarang() async {
  //       var url = Uri.parse(
  //         'https://jajan-id.up.railway.app/katalog/json');
  //       var response = await http.get(
  //       url,
  //       headers: {
  //           "Access-Control-Allow-Origin": "*",
  //           "Content-Type": "application/json",
  //       },
  //       );

  //       // melakukan decode response menjadi bentuk json
  //       var data = jsonDecode(utf8.decode(response.bodyBytes));

  //       // // melakukan konversi data json menjadi object ToDo
  //       // List<DataDetail> listToDo = [];
  //       // for (var d in data) {
  //       // if (d != null) {
  //       //     listToDo.add(DataDetail.fromJson(d));
  //       // }
  //       // }
  //       DataDetail dataDetail = DataDetail.fromJson(data);

  //       return dataDetail;
  //   }
}

class _DetailPageState extends State<DetailPage> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage([widget.index].image),
                //         fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // "${snapshot.data["nama"]}",
                      "Nama Toko",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   height: 50,
                    //   width: width,
                    //   child: ListView.builder(
                    //     itemCount: [widget.index].rate,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, int key) {
                    //       return Icon(
                    //         Icons.star,
                    //         color: Colors.yellow[900],
                    //         size: 34,
                    //       );
                    //     },
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      // "${snapshot.data["deskripsi"]}",
                      "Deskripsi",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              // "${snapshot.data["harga"]}",
                              "Harga",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewForm()))};
                        //   // shape: RoundedRectangleBorder(
                        //       // borderRadius: BorderRadius.circular(10)),
                        //   // color: Colors.orange[800],
                        //   // padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                        //   child: Text(
                        //     "Beri Ulasan",
                        //     style: TextStyle(color: Colors.orange, fontSize: 18),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    // nanti balik ke page katalog
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: height * 0.45,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReviewForm(),
                          ),
                        );
                      },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 1)
                        ]),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

//                   ),
//                 ),
//               );
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
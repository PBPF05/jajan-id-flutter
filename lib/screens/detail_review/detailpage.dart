// import 'package:jajan_id/model/detailjadwal_model.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:jajan_id/screens/detail_review/reviewform.dart';
// import 'package:jajan_id/req.dart';
// import 'package:provider/provider.dart';

// class DetailPage extends StatefulWidget {
//   const DetailPage({Key? key}) : super(key: key);

//   @override
//   _DetailPageState createState() => _DetailPageState();

// }

// class _DetailPageState extends State<DetailPage> {
//   Future<DetailJadwal> fetchDetail() async {
//     var req = context.read<AppRequest>();
//     Map<String, dynamic> data = await req.get("detail/jam_json");
//     return DetailJadwal.fromJson(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: FutureBuilder(
//         future: fetchDetail(),
//         builder: (context, snapshot) {
//           if (snapshot.data == null) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             if (!snapshot.hasData) {
//               return Column(
//                 children: const [
//                   Text(
//                     "Belum ada detail.",
//                     style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
//                   ),
//                   SizedBox(height: 8),
//                 ],
//               );
//             } else {
//               return SingleChildScrollView(
//                 child: Container(
//                   width: width,
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         height: height * 0.55,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     "https://c0.wallpaperflare.com/preview/591/6/382/plant-fruit-food-delhi.jpg"),
//                                 fit: BoxFit.cover)),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//                                 Colors.black.withOpacity(0.9),
//                                 Colors.black.withOpacity(0.5),
//                                 Colors.black.withOpacity(0.0),
//                                 Colors.black.withOpacity(0.0),
//                                 Colors.black.withOpacity(0.5),
//                                 Colors.black.withOpacity(0.9),
//                               ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight)),
//                         ),
//                       ),
//                       Container(
//                         width: width,
//                         margin: EdgeInsets.only(top: height * 0.5),
//                         padding: EdgeInsets.all(30),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                               topRight: Radius.circular(30)),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               // "${snapshot.data["nama"]}",
//                               "Detail Toko",
//                               style: TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                             SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               // data["hari"],
//                               // "Hari, jam buka-tutup",
//                               snapshot.data!.fields.hari,
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             Text(
//                               // "${snapshot.data!["deskripsi"]}",
//                               // data["deskripsi"],
//                               "Deskripsi",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.normal,
//                                   letterSpacing: 0.5,
//                                   wordSpacing: 1.5),
//                             ),
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(
//                                       "Price",
//                                       style: TextStyle(
//                                           color: Colors.grey[500],
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     Text(
//                                       // "${snapshot.data["harga"]}",
//                                       // data["harga"],
//                                       "Harga",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 28,
//                                           fontWeight: FontWeight.bold),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Positioned(
//                         left: 30,
//                         top: height * 0.05,
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Icon(
//                             Icons.keyboard_backspace,
//                             size: 42,
//                             color: Colors.orange,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         right: 30,
//                         top: height * 0.45,
//                         child: IconButton(
//                           icon: Icon(Icons.add_reaction_outlined),
//                           iconSize: 50,
//                           color: Colors.orange,
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ReviewForm(),
//                               ),
//                             );
//                           },

//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:jajan_id/model/detailbarang_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jajan_id/screens/detail_review/reviewform.dart';
// import 'package:jajan_id/ReviewForm.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                       "https://c0.wallpaperflare.com/preview/591/6/382/plant-fruit-food-delhi.jpg"),
                        fit: BoxFit.cover)),
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
                      "Detail Toko",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Selasa, 08:00 hingga pukul 20:00",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Makanan khas Sumatera Selatan.",
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
                              "Harga",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Rp. 5000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
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
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.orange,
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: height * 0.45,
                child: IconButton(
                  icon: Icon(Icons.add_reaction_outlined ),
                  iconSize: 50,
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReviewForm(),
                          ),
                        );
                      },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
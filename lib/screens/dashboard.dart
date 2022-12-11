import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:provider/provider.dart';
import 'package:jajan_id/model/toko_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  Future<Toko> fetchToDo() async {
    var url = Uri.parse('http://localhost:8000/dashboard/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    // List<Toko> listToko = [];
    // for (var d in data) {
    //   if (d != null) {
    //     listMovie.add(Toko.fromJson(d));
    //   }
    // }
    Toko tokoPengguna = Toko.fromJson(data);

    return tokoPengguna;
  }

  bool bukaTutup = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    var size = MediaQuery.of(context).size;

    final isi_card = [
      ['https://img.icons8.com/color/96/null/edit--v1.png', 'Detail'],
      [
        'https://img.icons8.com/office/80/null/time-span.png',
        'Jadwal Operasional'
      ],
      ['https://img.icons8.com/color/96/null/hamper.png', 'Daftar Barang'],
      ['https://img.icons8.com/dusk/64/null/plus-2-math.png', 'Tambah Barang']
    ];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
      body: Container(
        height: size.height * 3,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nama Toko",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Text(
                        "Alamat Toko",
                        style:
                            TextStyle(fontWeight: FontWeight.w600, height: 1.5),
                      ),
                      Text(
                        "Deskripsi Toko",
                        style: TextStyle(height: 2),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bukaTutup = !bukaTutup;
                        });
                      },
                      child: Text(bukaTutup ? "Tutup" : "Buka"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              bukaTutup ? Colors.red : Colors.green),
                    )
                  ],
                )
              ],
            ),
            Expanded(
                child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 2,
                    children: isi_card
                        .map(
                          (e) => Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(e[0] as String),
                                Text(
                                  e[1] as String,
                                  style: TextStyle(height: 2.5),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()))
          ],
        ),
      ),
    );
  }
}

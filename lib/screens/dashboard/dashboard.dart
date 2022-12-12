import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:jajan_id/screens/dashboard/create_toko.dart';
import 'package:jajan_id/screens/dashboard/daftar_barang.dart';
import 'package:jajan_id/screens/dashboard/detail_toko.dart';
import 'package:jajan_id/screens/dashboard/jadwal_operasional.dart';
import 'package:jajan_id/screens/dashboard/tambah_barang.dart';
import 'package:jajan_id/model/toko_model.dart';
import 'package:http/http.dart' as http;

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
  Future<List<Toko>> fetchToDo() async {
    var url = Uri.parse('https://jajan-id.up.railway.app/dashboard/json/');
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
    List<Toko> listToko = [];
    for (var d in data) {
      if (d != null) {
        listToko.add(Toko.fromJson(d));
      }
    }
    // Toko tokoPengguna = Toko.fromJson(data);
    // debugPrint(listToko[0].fields.nama);

    return listToko;
  }

  bool bukaTutup = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        drawer: const AppDrawer(),
        body:
        FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(
                    // child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Image(
                          image: AssetImage('assets/images/store_notexist.png'),
                          height: 200,
                        ),
                        const Text(
                          "Hai, ",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              height: 2,
                              fontSize: 20),
                        ),
                        const Text(
                          "Kamu belum punya toko nih!",
                          style: TextStyle(height: 1, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const CreateTokoPage();
                                }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent),
                            child: const Text("Buka Toko",
                                style: TextStyle(color: Colors.black)),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  final isiCard = [
                    [
                      'https://img.icons8.com/color/96/null/edit--v1.png',
                      'Detail',
                      StoreDetailPage(snapshot.data![0])
                    ],
                    [
                      'https://img.icons8.com/office/80/null/time-span.png',
                      'Jadwal Operasional',
                      const OperationalSchedPage()
                    ],
                    [
                      'https://img.icons8.com/color/96/null/hamper.png',
                      'Daftar Barang',
                      const ProductListPage()
                    ],
                    [
                      'https://img.icons8.com/dusk/64/null/plus-2-math.png',
                      'Tambah Barang',
                      AddProductPage(snapshot.data![0])
                    ]
                  ];
                  return
                    SizedBox(
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
                                    "${snapshot.data![0].fields.nama}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "${snapshot.data![0].fields.lokasi}, "
                                        "${snapshot.data![0].fields.kota},"
                                        "${snapshot.data![0].fields.provinsi}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        height: 1.5),
                                  ),
                                  Text(
                                    "${snapshot.data![0].fields.deskripsi}",
                                    style: const TextStyle(height: 2),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      // final req = Provider.of<AppRequest>(context, listen: false);
                                      // req.postJson('dashboard/bukatutup/', null);
                                      bukaTutup = !bukaTutup;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: bukaTutup
                                          ? Colors.red
                                          : Colors.green),
                                  child: Text(
                                    bukaTutup ? "Tutup" : "Buka",
                                    style: const TextStyle(color: Colors.white),
                                  ),
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
                                children: isiCard
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return e[2] as Widget;
                                          }));
                                        },
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Image.network(e[0] as String),
                                              Text(
                                                e[1] as String,
                                                style: const TextStyle(height: 2.5),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()))
                      ],
                    ),
                  );
                }
              }
            }));
  }
}

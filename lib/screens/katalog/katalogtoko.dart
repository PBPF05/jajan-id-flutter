import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jajan_id/models/katalog.dart';
import 'package:jajan_id/main.dart';
import 'package:jajan_id/components/drawer.dart';

class KatalogListPage extends StatefulWidget {
    const KatalogListPage({Key? key}) : super(key: key);

    @override
    _KatalogListPageState createState() => _KatalogListPageState();
}

class _KatalogListPageState extends State<KatalogListPage> {
  Future<List<DataKatalog>> fetchKatalog() async {
    var url = Uri.parse(
        'https://jajan-id.up.railway.app/katalog/json');
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
    List<DataKatalog> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(DataKatalog.fromJson(d));
      }
    }

    return listToDo;
  }

    Future<List<DataKatalog>> fetchKatalogSearched() async {
    var url = Uri.parse(
        'https://jajan-id.up.railway.app/katalog/json_searched_flutter');
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
    List<DataKatalog> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(DataKatalog.fromJson(d));
      }
    }

    return listToDo;
  }

  createDonasi(toko) async {
  final response = await http.post(
      Uri.parse(
          'https://jajan-id.up.railway.app/katalog/json_flutter/'),
      body: {
        'nama_toko': toko,
      });
  return response;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Katalog'),
          backgroundColor: Colors.orange,
        ),
        drawer: const AppDrawer(),
        body: Center(
          child: Column(children: [
            Expanded(flex: 10, child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search Toko",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.red,                    
                  ),
                ),
                TextButton(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
              child: Container(
                child: Expanded(flex: 11,
              child: FutureBuilder(
            future: fetchKatalogSearched(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada Toko :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 251, 247, 210),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "${snapshot.data![index].fields.nama}",
                                  style: const TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 241, 127, 95),
                                    shadows: [Shadow(
                                    color: Colors.yellow,
                                    blurRadius: 2,
                                    offset: Offset(1, 2),
                                  )]
                                  ),
                                ),
                                ),
                                Text(""),
                                Text(
                                  "${snapshot.data![index].fields.deskripsi}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${snapshot.data![index].fields.lokasi}, ${snapshot.data![index].fields.provinsi}, ${snapshot.data![index].fields.kota}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(""),
                                const SizedBox(height: 10),
                                Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                Icon(
                                    Icons.access_time,
                                    color: Colors.orange,
                                  ),
                                Text(
                                    snapshot.data![index].fields.buka == true ? "buka" : "tutup",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.sell,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                  " ${snapshot.data![index].fields.rangeHarga}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                    Icons.reduce_capacity,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                  " ${snapshot.data![index].fields.kondisi}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }
          )
            ),
                              ));
                      });
                    }
                )
               ],            
              ),
          ),    ),
            Expanded(flex: 11,
              child: FutureBuilder(
            future: fetchKatalog(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada Toko :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 251, 247, 210),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "${snapshot.data![index].fields.nama}",
                                  style: const TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 241, 127, 95),
                                    shadows: [Shadow(
                                    color: Colors.yellow,
                                    blurRadius: 2,
                                    offset: Offset(1, 2),
                                  )]
                                  ),
                                ),
                                ),
                                Text(""),
                                Text(
                                  "${snapshot.data![index].fields.deskripsi}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${snapshot.data![index].fields.lokasi}, ${snapshot.data![index].fields.provinsi}, ${snapshot.data![index].fields.kota}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(""),
                                const SizedBox(height: 10),
                                Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                Icon(
                                    Icons.access_time,
                                    color: Colors.orange,
                                  ),
                                Text(
                                    snapshot.data![index].fields.buka == true ? "buka" : "tutup",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.sell,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                  " ${snapshot.data![index].fields.rangeHarga}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                    Icons.reduce_capacity,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                  " ${snapshot.data![index].fields.kondisi}",                              
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                  ],
                                ),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }
          )
            )
          ]),
        )
        
        );
  }
}
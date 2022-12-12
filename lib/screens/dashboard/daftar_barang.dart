import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jajan_id/req.dart';
import 'package:jajan_id/screens/dashboard/detail_barang.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../model/barang_model.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Barang>> fetchToDo() async {
    var url = Uri.parse('http://localhost:8000/dashboard/barang/json/');
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
    List<Barang> listBarang = [];
    for (var d in data) {
      if (d != null) {
        listBarang.add(Barang.fromJson(d));
      }
    }
    // print(listBarang[0].fields.nama);
    return listBarang;
  }

  @override
  Widget build(BuildContext context) {
    final req = context.watch<AppRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Barang"),
      ),
      body: FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    children: const [
                      Text(
                        "Belum ada barang",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            // Route menu ke halaman utama
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ProductDetailPage(snapshot.data![index]);
                              }),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.nama}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
              }
            }
          }),
      //   if(req.loggedIn){
      //
      // }
    );
  }
}

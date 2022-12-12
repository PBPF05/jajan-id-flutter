import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jajan_id/model/jadwal_model.dart';
import 'package:http/http.dart' as http;

class OperationalSchedPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OperationalSchedPageState();
  
}

class _OperationalSchedPageState extends State<OperationalSchedPage>{
  Future<List<JadwalOperasi>> fetchToDo() async {
    var url = Uri.parse('http://localhost:8000/dashboard/jadwal/json/');
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
    List<JadwalOperasi> listJadwal = [];
    for (var d in data) {
      if (d != null) {
        listJadwal.add(JadwalOperasi.fromJson(d));
      }
    }
    // print(listBarang[0].fields.nama);
    return listJadwal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Operasional"),
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
                        "Belum ada jadwal operasional",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) =>
                      //   GestureDetector(
                      // onTap: () {
                      //   // Route menu ke halaman utama
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) {
                      //       return ProductDetailPage(snapshot.data![index]);
                      //     }),
                      //   );
                      // },
                      // child:
                      Container(
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
                              "${snapshot.data![index].fields.hari}, "
                                  "${snapshot.data![index].fields.jamBuka} - "
                                  "${snapshot.data![index].fields.jamTutup}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
              }
            }
          }),
    );
  }
  
}
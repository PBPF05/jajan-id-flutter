import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:provider/provider.dart';
import 'package:jajan_id/model/toko_model.dart';
import 'package:http/http.dart' as http;

class DashBoardPage extends StatefulWidget{
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

class _DashBoardPageState extends State<DashBoardPage>{
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return const Center(child: CircularProgressIndicator());
            } else{
              if(!snapshot.hasData){
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black, blurRadius: 2.0)
                      ]),
                  child: Column(

                  ),
                );
              } else {
                return Container();
                // return ListView.builder(itemBuilder: itemBuilder);
              }
            }
          }
      )
    );
  }
  
}
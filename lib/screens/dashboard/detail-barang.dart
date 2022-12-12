import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jajan_id/screens/dashboard/daftar-barang.dart';

import '../../model/barang_model.dart';

class ProductDetailPage extends StatefulWidget{
  ProductDetailPage(this.barang);

  final Barang barang;

  @override
  State<StatefulWidget> createState() => _ProductDetailPageState();
  
}

class _ProductDetailPageState extends State<ProductDetailPage>{
  _showNama(){
    return Text(
      "Nama barang: ${widget.barang.fields.nama}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showHarga(){
    return Text(
      "Harga: ${widget.barang.fields.harga}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showJenis(){
    return Text(
      "Tipe barang: ${widget.barang.fields.jenis}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showDeskripsi(){
    return Text(
      "Deskripsi: ${widget.barang.fields.deskripsi}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Detail ${widget.barang.fields.nama}'),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                children: [
                  Row(
                    children: [
                      _showNama()
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      _showHarga()
                    ],
                  ),
                  Row(
                    children: [
                      _showJenis()
                    ],
                  ),
                  Row(
                    children: [
                      _showDeskripsi()
                    ],
                  ),

                  Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: (){Navigator.pop(context);},
                      child: Text("Back"),
                    ),
                  )
                ]),
          )
      ),
    );
  }
  
}
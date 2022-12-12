import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/toko_model.dart';

class StoreDetailPage extends StatefulWidget{
  StoreDetailPage(this.toko);

  final Toko toko;
  @override
  State<StatefulWidget> createState() => _StoreDetailPageState();
  
}

class _StoreDetailPageState extends State<StoreDetailPage>{
  _showNama(){
    return Text(
      "Nama toko: ${widget.toko.fields.nama}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showDeskripsi(){
    return Text(
      "Deskripsi: ${widget.toko.fields.deskripsi}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showLokasi(){
    return Text(
      "Lokasi Toko: ${widget.toko.fields.lokasi}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showKota(){
    return Text(
      "Kota toko: ${widget.toko.fields.kota}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }

  _showProvinsi(){
    return Text(
      "Provinsi toko: ${widget.toko.fields.provinsi}",
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Toko"),
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
                      _showDeskripsi()
                    ],
                  ),
                  Row(
                    children: [
                      _showLokasi()
                    ],
                  ),
                  Row(
                    children: [
                      _showKota()
                    ],
                  ),
                  Row(
                    children: [
                      _showProvinsi()
                    ],
                  ),
                ]),
          )
      ),
    );
  }
  
}
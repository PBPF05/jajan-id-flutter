import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jajan_id/req.dart';
import 'package:provider/provider.dart';

import '../../model/toko_model.dart';

class AddProductPage extends StatefulWidget{
  AddProductPage(this.toko);

  final Toko toko;
  @override
  State<StatefulWidget> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage>{
  // final req = Provider.of<AppRequest>(context, listen: false);
  final _formKey = GlobalKey<FormState>();
  String inputNama = "";
  int inputHarga = 0;
  String inputJenis = "makanan";
  List<String> listJenis = ['makanan', 'minuman', 'pakaian', 'alat tulis'];
  String inputDeskripsi = "";
  int toko_barang = 4;

  @override
  Widget build(BuildContext context) {
    final response = context.watch<AppRequest>();
    // final req = Provider.of<AppRequest>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
      ),
      body: Column(
        children: [Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Contoh: Ayam Gepuk",
                          labelText: "Nama Barang",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange, width: 2),
                          )
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          inputNama = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          inputNama = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama Barang tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: 20000",
                        labelText: "Harga",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          inputHarga = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          inputHarga = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Harga tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: DropdownButton(
                      value: inputJenis,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: listJenis.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          inputJenis = newValue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Ayam Gepuk terlezat di Depok",
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          inputDeskripsi = value!;
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          inputDeskripsi = value!;
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Lokasi Toko tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(onPressed: () async {
                    // // Provider.of<AppRequest>(context, listen: false);
                    // if(_formKey.currentState!.validate()) {
                    //   final finalReq = response.postJson("dashboard/json/", jsonEncode({
                    //     "inputNama" : inputNama,
                    //     "inputHarga" : inputHarga,
                    //     "inputJenis" : inputJenis,
                    //     "inputDeskripsi" : inputDeskripsi,
                    //     "inputToko" : widget.toko.pk,
                    //   }));
                    // };

                  }, child: Text("Submit"))
                ],
              ),
            ),
          ),
        ),]
      ),
    );
  }
  
}
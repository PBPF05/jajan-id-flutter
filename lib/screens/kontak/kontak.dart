import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:jajan_id/components/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key, required String title});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}


class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send us a Message!"),
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 251, 187, 68)),
        ),
      ),
      // Menambahkan drawer menu
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Subject",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Subject tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),  
              
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Pesan",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Pesan tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),  

            
              TextButton(
                child: const Text(
                  "Kirim",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 251, 187, 68)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                Center(
                                    child: const Text(
                                        'Berhasil menambahkan pesan!')),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    );                    
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreDetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StoreDetailPageState();
  
}

class _StoreDetailPageState extends State<StoreDetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Toko"),
      ),
    );
  }
  
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OperationalSchedPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OperationalSchedPageState();
  
}

class _OperationalSchedPageState extends State<OperationalSchedPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Operasional"),
      ),
    );
  }
  
}
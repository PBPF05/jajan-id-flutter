import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jajan_id/screens/dashboard/dashboard.dart';
import 'package:jajan_id/components/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: "Homepage",),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)),
      boxShadow: [
        BoxShadow(
//          color: Colors.grey.withOpacity(0.5),
//          spreadRadius: 1,
//          blurRadius: 2,
//          offset: Offset(0, 1), // changes position of shadow
            ),
      ],
    );
  }

  Expanded getExpanded(String imageName, String mainText, String subText) {
    return Expanded(
      child: TextButton(
        style : TextButton.styleFrom(padding : EdgeInsets.all(0)),
        child: Container(
          margin:
              EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
          decoration: getBoxDecoration(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'images/main/$imageName.png',
                    height: 80.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  mainText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  subText,
                  style: const TextStyle(
//                              fontWeight: FontWeight.,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashBoardPage(title: '',)));
        },
      ),
    );
  }

  
  BottomNavigationBarItem getBottomNavigationItem(
      String title, IconData IconName) {
    return BottomNavigationBarItem(
      icon: Icon(
        IconName,
        size: 35.0,
      ),
      label: "$title"
    );
  }

  BottomNavigationBarItem getBottomNavigationItemLogout(
      String title, IconData IconName) {
    return BottomNavigationBarItem(
      icon: const Icon(
        Icons.logout
      ),
      label: "$title"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "JAJAN.ID",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      drawer: const AppDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  getExpanded('dashboard', 'Dashboard', ''),
                  getExpanded('catalogue', 'Catalogue', ''),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  getExpanded('chat', 'Chat', ''),
                  getExpanded('detail', 'Detail', ''),
                ],
              ),
            ),

          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          getBottomNavigationItem(
              'Home',
              const IconData(0xead0,
                  fontFamily: 'outline_material_icons',
                  fontPackage: 'outline_material_icons')),
          getBottomNavigationItem(
              'Logout',
              const IconData(0xe3b3,
                  fontFamily: 'outline_material_icons',
                  fontPackage: 'outline_material_icons')),
          getBottomNavigationItem(
              'Send Message',
              const IconData(0xe3b3,
                  fontFamily: 'outline_material_icons',
                  fontPackage: 'outline_material_icons')),
        ], 
//        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
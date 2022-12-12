import 'package:flutter/material.dart';
import 'package:jajan_id/screens/chat/list.dart';
import 'package:jajan_id/screens/home.dart';
import 'package:jajan_id/screens/login.dart';
import 'package:jajan_id/screens/dashboard.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final pages = [
    ["Counter", const MyHomePage(title: "Program Counter")],
    ["Login", const LoginPage()],
    ["Chat", const ChatListPage()],
    ["Dashboard", const DashBoardPage(title: "Dashboard")]
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: pages
            .map(
              (e) => ListTile(
                title: Text(e[0] as String),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => e[1] as Widget,
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

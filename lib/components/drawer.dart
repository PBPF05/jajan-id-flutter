import 'package:flutter/material.dart';
import 'package:jajan_id/screens/chat/list.dart';
import 'package:jajan_id/screens/home.dart';
import 'package:jajan_id/screens/detail_review/detailpage.dart';
import 'package:jajan_id/screens/auth/login.dart';
import 'package:jajan_id/screens/dashboard/dashboard.dart';
import 'package:jajan_id/screens/katalog/katalogtoko.dart';
import 'package:jajan_id/screens/kontak/kontak.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final pages = [
    ["Home", const MyHomePage(title: "Homepage",)],
    ["Login", const LoginPage()],
    ["Katalog", const KatalogListPage(title: '',)],
    ["Chat", const ChatListPage(title: '',)],
    ["Dashboard", const DashBoardPage(title: "Dashboard")],
    ["Send us a Message", const MyFormPage(title: 'Kontak',)],
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

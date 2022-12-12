import 'package:flutter/material.dart';
import 'package:jajan_id/req.dart';
import 'package:jajan_id/screens/chat/list.dart';
import 'package:jajan_id/screens/home.dart';
import 'package:jajan_id/screens/detail_review/detailpage.dart';
import 'package:jajan_id/screens/auth/login.dart';
import 'package:jajan_id/screens/dashboard/dashboard.dart';
import 'package:jajan_id/screens/katalog/katalogtoko.dart';
import 'package:jajan_id/screens/kontak/kontak.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final pages = [
    ["Home", const MyHomePage()],
    [
      "Katalog",
      const KatalogListPage(
        title: '',
      )
    ],
    ["Chat", const ChatListPage()],
    ["Dashboard", const DashBoardPage(title: "Dashboard")],
    [
      "Send us a Message",
      const MyFormPage(
        title: 'Kontak',
      )
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final req = context.read<AppRequest>();
    return Drawer(
      child: Column(
        children: [
          req.loggedIn
              ? ListTile(
                  title: Text(
                    "Halo, ${req.jsonData['user']['first_name']}",
                  ),
                )
              : ListTile(
                  title: Text("Log In"),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const LoginPage(),
                      ),
                    );
                  },
                ),
          ...pages
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
              .toList()
        ],
      ),
    );
  }
}

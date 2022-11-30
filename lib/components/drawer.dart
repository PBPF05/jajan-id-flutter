import 'package:flutter/material.dart';
import 'package:jajan_id/screens/home.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("counter_7"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const MyHomePage(title: "Program Counter"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

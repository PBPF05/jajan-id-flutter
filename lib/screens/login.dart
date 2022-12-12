import 'package:flutter/material.dart';
import 'package:jajan_id/components/drawer.dart';
import 'package:jajan_id/req.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Username',
              ),
              onChanged: (value) => setState(() {
                username = value;
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) => setState(() {
                password = value;
              }),
            ),
            TextButton(
              onPressed: () {
                final req = Provider.of<AppRequest>(context, listen: false);
                req.login("auth/login", {
                  "username": username,
                  "password": password,
                }).then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value["message"],
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
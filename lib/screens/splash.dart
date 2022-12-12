import 'package:flutter/material.dart';
import 'package:jajan_id/screens/auth/login.dart';
import 'package:jajan_id/screens/auth/register.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final circularBtnStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(100, 60)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shopping_bag,
                    size: 160,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Selamat datang di Jajan.id!",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const LoginPage(),
                      ),
                    ),
                    style: circularBtnStyle,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => RegisterPage(),
                      ),
                    ),
                    style: circularBtnStyle,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

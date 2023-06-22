import 'package:flutter/material.dart';
import 'package:week4/loginPage/fronttext.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "asset/primaryBg.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          const Frontpage()
        ],
      ),
    );
  }
}

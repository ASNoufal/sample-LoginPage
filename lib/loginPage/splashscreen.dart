import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4/HomePage/homepage.dart';
import 'package:week4/loginPage/login_page.dart';
import 'package:week4/main.dart';

class Spachscreen extends StatefulWidget {
  const Spachscreen({super.key});

  @override
  State<Spachscreen> createState() => _SpachscreenState();
}

class _SpachscreenState extends State<Spachscreen> {
  @override
  void initState() {
    super.initState();
    saveData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/exodus.gif"), fit: BoxFit.fitHeight)),
    );
  }
}

Future<void> saveData(context) async {
  final prefs = await SharedPreferences.getInstance();
  final use = prefs.getBool(Savekey);
  if (use == null || use == false) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            ));
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}

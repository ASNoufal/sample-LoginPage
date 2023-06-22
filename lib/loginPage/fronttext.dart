import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week4/HomePage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:week4/main.dart';

const shapeofbutton = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), bottomRight: Radius.circular(20)));

class Frontpage extends StatefulWidget {
  const Frontpage({super.key});

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  void close() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  void alertWrong() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              "Id and Pass are incorrect!!!",
              style: GoogleFonts.aBeeZee(),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"))
            ],
          );
        });
  }

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  // Future<void> onData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final pass = prefs.setString("userid",_usernamecontroller.text  );
  // }

  String use = "Naufal";
  String pas = "nappu";

  void nextpage() async {
    if (_usernamecontroller.text.trim() == use &&
        _passwordcontroller.text.trim() == pas) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(Savekey, true);
      close();
    } else {
      alertWrong();
    }
  }

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          width: 100,
          height: 200,
        ),
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Text(
              "Login",
              style: GoogleFonts.abel(color: Colors.white, fontSize: 39),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              color: Color.fromARGB(49, 43, 40, 40)),
          height: 530,
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              color: Color.fromARGB(75, 84, 81, 81),
            ),
            margin: const EdgeInsets.only(left: 20, top: 25),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextField(
                    controller: _usernamecontroller,
                    decoration: const InputDecoration(label: Text("Username")),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextField(
                    controller: _passwordcontroller,
                    decoration: const InputDecoration(label: Text("Password")),
                  ),
                ),
                const Row(
                  children: [
                    Spacer(),
                    SizedBox(width: 130, child: Text("Forgot Password")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: shapeofbutton),
                      onPressed: () {
                        nextpage();
                      },
                      child: const Text("SignButton")),
                ),
                const SizedBox(
                  width: 300,
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(shape: shapeofbutton),
                        onPressed: () {},
                        child: Image.asset("asset/icon_google.png")),
                    const Text("Or"),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(shape: shapeofbutton),
                      onPressed: () {},
                      child: Image.asset("asset/icon_apple.png"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

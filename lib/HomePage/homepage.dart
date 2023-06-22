import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4/loginPage/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final prefx = await SharedPreferences.getInstance();
                prefx.clear();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (ctx) {
                  return LoginPage();
                }), (route) => false);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
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
          ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text("hello"),
                    leading: index.isEven
                        ? CircleAvatar()
                        : Container(
                            width: 40,
                            height: 40,
                            color: Colors.blue,
                          ),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 20)
        ],
      ),
    );
  }
}
 // SafeArea(
          //   child: Column(children: [
          //     ...List.generate(
          //         8, (index) => index % 2 == 0 ? circle() : square()),
          //     ElevatedButton(
          //         onPressed: () async {
          //           SharedPreferences sharedPreferences =
          //               await SharedPreferences.getInstance();
          //           sharedPreferences.clear();
          //           Navigator.pushAndRemoveUntil(context,
          //               MaterialPageRoute(builder: (ctx) {
          //             return LoginPage();
          //           }), (route) => false);
          //         },
          //         child: Text("signout"))
          //   ]),
          // )
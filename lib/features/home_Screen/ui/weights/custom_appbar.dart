import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        child: Image.asset(
                          "assets/account.png",
                          color: Colors.pinkAccent,
                        )),
                    Text("Welcome , Dalida", style: TextStyle(fontSize: 17)),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: 40,
                        height: 30,
                        child:
                            Image.asset("assets/icons8-notification-128.png")),
                    Container(
                        width: 40,
                        height: 30,
                        child: Image.asset('assets/search.png'))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

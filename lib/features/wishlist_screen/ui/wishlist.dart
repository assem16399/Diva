import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Center(
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 15,
              children: [],
            ),
          ],
        ),
      )),
    );
  }
}

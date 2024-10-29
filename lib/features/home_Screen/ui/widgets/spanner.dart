import 'package:flutter/cupertino.dart';

class Spanner extends StatelessWidget {
  const Spanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/8178681.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/9717850.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';

class MyProudectsList extends StatelessWidget {
  const MyProudectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 150,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: Image.asset(
                      'assets/prodect.jpg',
                    ).image,
                    fit: BoxFit.fill,
                  )),
              height: 240,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            'assets/icons8-like-50.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'assets/add-to-cart.png',
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          verticalSpace(5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Baby blue blouse'),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Text('4.9')
                ],
              )
            ],
          ),
          verticalSpace(5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('545 L.E')],
          )
        ],
      ),
    );
  }
}

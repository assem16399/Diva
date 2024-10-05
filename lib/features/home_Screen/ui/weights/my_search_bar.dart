import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class MySearchBar extends StatelessWidget {
  MySearchBar({super.key});
  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 270,
            height: 50,
            child: AppTextFormField(
                hintText: 'search here',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.pinkAccent[100],
                ),
                controller: textcontroller),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pinkAccent[50],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/settings.png",
                color: Colors.pinkAccent[100],
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

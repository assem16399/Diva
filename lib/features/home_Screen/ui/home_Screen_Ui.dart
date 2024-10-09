import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/features/home_Screen/ui/weights/custom_appbar.dart';
import 'package:diva/features/home_Screen/ui/weights/my_search_bar.dart';
import 'package:diva/features/home_Screen/ui/weights/proudectsList.dart';
import 'package:flutter/material.dart';

class HomeScreenUi extends StatelessWidget {
  HomeScreenUi({super.key});
  List<String> Tabs = ['All', 'New in', 'Popular', 'Modest', 'Formal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const CustomAppBar(),
            verticalSpace(10),
            MySearchBar(),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset('assets/Frame 1000004533.png'),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Tabs.length,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pinkAccent[100]?.withOpacity(.5)),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              Tabs[index],
                              style: TextStyles.font14BlackW400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 15,
              children: [
                MyProudectsList(),
                MyProudectsList(),
                MyProudectsList(),
                MyProudectsList(),
                MyProudectsList(),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

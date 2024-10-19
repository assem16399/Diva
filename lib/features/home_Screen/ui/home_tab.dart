import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/text_styles.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_products_list_item.dart';
import 'package:diva/features/home_Screen/ui/widgets/my_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    const tabs = ['All', 'New in', 'Popular', 'Modest', 'Formal'];
    return Column(
      children: [
        verticalSpace(10),
        const MySearchBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Image.asset('assets/Frame 1000004533.png'),
        ),
        verticalSpace(10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return FittedBox(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pinkAccent[100]?.withOpacity(.5),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          tabs[index],
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 265,
                crossAxisSpacing: 30.w,
                mainAxisSpacing: 10,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const MyProductsListItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}

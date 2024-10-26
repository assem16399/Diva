import 'package:diva/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class CategriesTabList extends StatefulWidget {
  const CategriesTabList(
      {required this.categoriesNames, this.onCategoryChanged, super.key});

  final List<String> categoriesNames;
  final void Function(int)? onCategoryChanged;
  @override
  State<CategriesTabList> createState() => _CategriesTabListState();
}

class _CategriesTabListState extends State<CategriesTabList> {
  var _selectedIndex = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          itemCount: widget.categoriesNames.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _changeTab(index);
                widget.onCategoryChanged?.call(index);
              },
              child: Container(
                height: 40,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _selectedIndex == index
                      ? Colors.pinkAccent[100]
                      : Colors.pinkAccent[300]?.withOpacity(.5),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      widget.categoriesNames[index],
                      style: TextStyles.font14BlackW400,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_products_page/utils/constants.dart';

class ButtonGroupSpaced extends StatefulWidget {
  final List<String> items;

  ButtonGroupSpaced({required this.items});

  @override
  _ButtonGroupSpacedState createState() => _ButtonGroupSpacedState();
}

class _ButtonGroupSpacedState extends State<ButtonGroupSpaced> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: this.widget.items.map((item) {
          int currentIndex = this.widget.items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = currentIndex;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
              margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: activeIndex == currentIndex
                      ? Constants.primaryColor
                      : Color.fromRGBO(163, 167, 168, 1),
                ),
              ),
              child: Text(item),
            ),
          );
        }).toList(),
      ),
    );
  }
}

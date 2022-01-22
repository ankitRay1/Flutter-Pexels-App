// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onPressed;

  final bool isBorderCheck;
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onPressed,
      this.isBorderCheck = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border:
              Border(top: BorderSide(color: Colors.blueAccent, width: 3.0))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color:
                      i == selectedIndex ? Colors.blueAccent : Colors.black45,
                  size: 32.0,
                ),
              )))
          .values
          .toList(),
      onTap: onPressed,
    );
  }
}

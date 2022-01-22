import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wallpaperapp/screens/downloadscreens.dart';
import 'package:wallpaperapp/screens/screens.dart';
import 'package:wallpaperapp/widgets/customtabbar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screen = [
    HomeScreen(),
    // ignore: prefer_const_constructors
    DownloadScreen(),
    // ignore: prefer_const_constructors
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.download_rounded,
    Icons.person_outline_rounded
  ];

  int _selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,

        // ignore: prefer_const_constructors
        child: Scaffold(
          body: _screen[_selctedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selctedIndex,
              onPressed: (index) => setState(() => _selctedIndex = index),
            ),
          ),
        ));
  }
}

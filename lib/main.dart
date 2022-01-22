import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaperapp/screens/navscreen.dart';
import 'package:wallpaperapp/screens/screens.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: const Color(0xffEBF3F5),
      ),
      // ignore: prefer_const_constructors
      home: NavScreen(),
    );
  }
}

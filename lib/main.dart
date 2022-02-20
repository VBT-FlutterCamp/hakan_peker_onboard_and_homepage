import 'package:email_screen/features/onboard/onboard_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xffe8edfc),
        appBarTheme:const AppBarTheme(color: Color(0xffe8edfc))
      ),
      home: const OnBoardView(),
    );
  }
}
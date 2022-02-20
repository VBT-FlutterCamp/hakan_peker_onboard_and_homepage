import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: ""),
      ],
    );
  }
}

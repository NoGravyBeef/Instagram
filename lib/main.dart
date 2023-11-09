import 'package:flutter/material.dart';
import 'package:instagram/pages/home_page.dart';
import './style.dart' as themefile;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      theme: themefile.theme,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_box_outlined),
              onPressed: () {},
              iconSize: 30),
        ],
      ),
      body: [const HomePage(), const Text('샵페이지')][page],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        /*아이콘 아래 텍스트 쓸지말지*/
        onTap: (i) {
          setState(() {
            page = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
        ],
      ),
    );
  }
}

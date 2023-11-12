import 'package:flutter/material.dart';
import 'package:instagram/main.dart' as main;
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.data});
  final dynamic data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scroll = ScrollController();

  getmore() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        getmore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isNotEmpty) {
      return ListView.builder(
        itemCount: 3,
        controller: scroll,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network(widget.data[i]['image']),
              Text('좋아요: ${widget.data[i]['likes']}'),
              Text(widget.data[i]['user']),
              Text(widget.data[i]['content']),
            ],
          );
        },
      );
    } else {
      return const Text('로딩중');
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:instagram/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.data,
    this.addData,
  });
  final dynamic data;
  final dynamic addData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scroll = ScrollController();

  getmore() async {
    var result = await http
        .get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);
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
        itemCount: widget.data.length,
        controller: scroll,
        itemBuilder: (c, i) {
          return Column(
            children: [
              widget.data[i]['image'].runtimeType == String
                  ? Image.network(widget.data[i]['image'])
                  : Image.file(widget.data[i]['image']),
              GestureDetector(
                child: Text(widget.data[i]['user']),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (c) => const Profile()));
                },
              ),
              Text('좋아요: ${widget.data[i]['likes']}'),
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

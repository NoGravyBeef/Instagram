import 'package:flutter/material.dart';
//import 'package:instagram/style.dart' as themefile;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (c, i) {
          return Column(
            children: [
              Image.network('https://codingapple1.github.io/kona.jpg'),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('좋아요'),
                    Text('글쓴이'),
                    Text('글내용'),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

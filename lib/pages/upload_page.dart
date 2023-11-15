import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({
    Key? key,
    this.userImage,
    this.setUserContent,
    this.addMyData,
  }) : super(key: key);
  final dynamic userImage;
  final dynamic setUserContent;
  final dynamic addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                addMyData();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.send)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImage),
          const Text('이미지업로드화면'),
          TextField(
            onChanged: (text) {
              setUserContent(text);
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/upload_page.dart';
import './style.dart' as themefile;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

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
  var data = [];
  dynamic userImage;
  dynamic userContent;

  addMyData() {
    var myData = {
      //데이터 개수로 ID
      "id": data.length,
      "image": userImage,
      "likes": 5,
      "date": "July 25",
      "content": userContent,
      "liked": false,
      "user": "John Kim"
    };
    setState(() {
      //원하는 자리에 data 추가하는 법
      data.insert(0, myData);
    });
  }

  setUserContent(a) {
    setState(() {
      userContent = a;
    });
  }

  addData(a) {
    setState(() {
      data.add(a);
    });
  }

  getdata() async {
    var getresult = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var decodedresult = jsonDecode(getresult.body);
    setState(() {
      data = decodedresult;
    });
  }

  saveData() async {
    var storage = await SharedPreferences.getInstance();
    //storage.setStringList('데이터들', );
    var result = storage.getString('데이터들') ?? '없는데요?';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    getdata();
  }

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
            onPressed: () async {
              // Navigator를 미리 저장
              var navigator = Navigator.of(context);

              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  userImage = File(image.path);
                });
              }
              // 저장된 Navigator를 사용하여 push
              navigator.push(MaterialPageRoute(
                  builder: (c) => Upload(
                        userImage: userImage,
                        setUserContent: setUserContent,
                        addMyData: addMyData,
                      )));
            },
            iconSize: 30,
          ),
        ],
      ),
      body: [
        HomePage(
          data: data,
          addData: addData,
        ),
        const Text('샵페이지')
      ][page],
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

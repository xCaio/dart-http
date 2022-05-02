import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final url = "https://wallet-pet-e902f-default-rtdb.firebaseio.com/cartao-pet/.json";
  var _postsJson = [];

  void fetchPosts() async{
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });


    } catch (err) {

    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i){
            final post = _postsJson[i];
            return Text("Nome: ${post['nome']}\n Pelagem: ${post['pelagem']}\n Proprietarios: ${post['proprietarios']}\n\n");
          }
          )
      )
    );
  }
}
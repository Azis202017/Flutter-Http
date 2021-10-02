import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pict/src/model/image_model.dart';
import 'package:pict/src/widgets/images_list.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _incNumber = 0;
  List<ImageModel> images = [];
  // Menambahkan nilai dari variable _incNumber
  void _fetchImage() async {
    _incNumber++;

    var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$_incNumber'));
    var imagesModel = ImageModel.fromJson(jsonDecode(response.body));
    setState(() {
      // ignore: avoid_print
      images.add(imagesModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lets get some hello!'),
        centerTitle: false,
      ),
      body : ImageList(images),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchImage,
        child:const  Icon(Icons.add),
      ),
    );
  }
}

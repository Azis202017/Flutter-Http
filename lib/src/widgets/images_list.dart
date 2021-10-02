import 'package:flutter/material.dart';
import '../model/image_model.dart';

// ignore: must_be_immutable
class ImageList extends StatelessWidget {
  List<ImageModel> images = [];
  ImageList(this.images, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        if (images.isEmpty) {
          return const Text('Hello world');
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Column(
              children: [
                
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    right: 24,
                    left: 24,
                  ),
                  child: Image.network('${images[index].url}'),
                ),
                Container(
                  margin: const EdgeInsets.only(top : 24, bottom: 24),
                  child:  Text('${images[index].title}'),
                )
              ],
            ),
          );
        }
      },
    );
  }
}

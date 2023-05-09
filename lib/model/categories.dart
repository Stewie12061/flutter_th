import 'package:flutter/cupertino.dart';

class Categories {
  String id;
  String title;
  String image;

  Categories({required this.id, required this.title, required this.image});

  Widget getImageWidget() {
    return Image.network(image);
  }

}

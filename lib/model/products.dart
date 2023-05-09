import 'package:flutter/cupertino.dart';

class Products {
  String id;
  String title, description, image;
  double price;

  Products(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price});
  Widget getImageWidget() {
    return Image.network(image);
  }
}

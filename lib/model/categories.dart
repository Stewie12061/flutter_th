import 'package:flutter/material.dart';

class Categories {
  int id;
  String title;
  String image;

  Categories({required this.id, required this.title, required this.image});

  static List<Categories> init() {
    List<Categories> data = [
      Categories(
          id: 1,
          title: 'KFC',
          image:
              'https://upload.wikimedia.org/wikipedia/vi/thumb/7/7e/Logo_KFC.svg/1200px-Logo_KFC.svg.png'),
      Categories(
          id: 2,
          title: 'Starbucks',
          image:
              'https://upload.wikimedia.org/wikipedia/vi/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png'),
      Categories(
          id: 3,
          title: 'Jolibee',
          image: 'https://upload.wikimedia.org/wikipedia/vi/thumb/7/7e/Logo_KFC.svg/1200px-Logo_KFC.svg.png'
          ),

      Categories(
          id: 4,
          title: 'Lotteria',
          image: 'https://www.lotteria.vn/grs-static/icons/logo_512.png'
          )
              
    ];
    return data;
  }
}

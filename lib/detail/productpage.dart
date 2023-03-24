import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/homepage/components/body.dart';
import 'package:thflutter/model/prodcts.dart';

import 'components/body.dart';

class ProductPage extends StatelessWidget{
  static String routeName = "/detail";
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Detail'),
      ),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetailArguments{
  final Products product;

  ProductDetailArguments.Arguments({required this.product});
}

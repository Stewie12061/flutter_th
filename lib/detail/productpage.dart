import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/model/products.dart';

import 'components/body.dart';

class ProductPage extends StatelessWidget{
  static String routeName = "/detail";

  const ProductPage({super.key});
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
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Detail'),
      ),
      body: Body(product: arguments!.product),
    );
  }
}

class ProductDetailsArguments{
  final Products product;

  ProductDetailsArguments.Arguments({required this.product});
}

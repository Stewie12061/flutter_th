import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/products.dart';


class FavoriteDetail extends StatelessWidget {
  final List<Products> products;
  FavoriteDetail({required this.products});

  @override
  Widget build(BuildContext context) {
    print(products.length.toString());
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return ProductItemList(product: products[index],);
          },
        ),
      ),
    );
  }
}
class ProductItemList extends StatelessWidget {
  Products product;
  ProductItemList({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(product.image,fit: BoxFit.fill,),
            ),
            const SizedBox(width: 5,),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,style: TextStyle(fontSize: 18),),
                    Expanded(
                      child: Text(
                        product.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
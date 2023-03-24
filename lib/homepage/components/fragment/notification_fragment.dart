import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thflutter/homepage/components/fragment/home_fragment_product.dart';
import 'package:thflutter/model/prodcts.dart';

class FavoriteDetail extends StatelessWidget{
  List<Products> products;
  FavoriteDetail(this.products);

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

class ProductItemList extends StatelessWidget{
  Products product;
  ProductItemList({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title),
                  Expanded(
                    child: Text(product.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

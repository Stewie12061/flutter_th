import 'package:thflutter/model/products.dart';

class Cart {
  static List<Products> cart = [];
  void addProductToCart(Products? product){
    cart.add(product!);
  }

  List<Products> getCart() {
    return cart;
  }
}
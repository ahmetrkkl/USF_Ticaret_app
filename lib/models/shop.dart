import 'dart:ffi';

import 'package:ecoomerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier{
  // Products for sale
  final List<Product> _shop=[
    // Product1
    Product(
        name: "Gri Bebek Bakım Çantası ",
        price: 379.90,
        description: "Modern ebeveynlerin hayatını kolaylaştıran ve şık bir çözümdür.",
        imagePath:"assets/bagGrey.png",
    ),
    // Product2
    Product(
        name: "Siyah Bebek Bakım Çantası ",
        price: 379.90,
        description: "Şıklık ve pratiklik arayan modern ebeveynler için ideal bir seçenektir.",
        imagePath:"assets/bagBlack.png",
    ),
    // Product3
    Product(
        name: "Ana Kucağı Puset ",
        price: 489.90,
        description: "Ana Kucağı Puset, bebeğinizle seyahat etmenin konforlu ve pratik bir yoludur.",
        imagePath:"assets/bagBaby.png",
    ),
    // Product4
    Product(
        name: "Bebek Bakım El Çantası ",
        price: 389.90,
        description: "Bebek Bakım El Çantası, ebeveynlerin günlük yaşamlarını kolaylaştırır.",
        imagePath:"assets/bagMein.png",
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String picture;
  final String name;
  final String description;
  final String size;
  final String color;
  final int price;
  final int old_price;
  final String Url;

  Product({
    @required this.id,
    @required this.picture,
    @required this.name,
    @required this.description,
    @required this.size,
    @required this.price,
    @required this.color,
    @required this.old_price,
    @required this.Url,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        name: "Red Dress",
        picture: "images/products/red_dress.jpg",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        old_price: 1199,
        price: 999,
        size: "M",
        color: "Red",
        Url: "https://shoppyyy.page.link/red_dress"),
    Product(
        id: '2',
        name: "Black Blazer",
        picture: "images/products/blazer_black.jpg",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        old_price: 1299,
        price: 999,
        size: "L",
        color: "Black",
        Url: "https://shoppyyy.page.link/black_blazer"),
    Product(
        id: '3',
        name: "Blue Top",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        picture: "images/products/blue_top.jpeg",
        old_price: 1299,
        price: 799,
        size: "M",
        color: "Blue",
        Url: "https://shoppyyy.page.link/blue_top"),
    Product(
        id: '4',
        name: "Party Frock",
        picture: "images/products/girl_frock.jpg",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        old_price: 2299,
        price: 1299,
        size: "S",
        color: "Peach",
        Url: "https://shoppyyy.page.link/party_frock"),
    Product(
        id: '5',
        name: "Black Heels",
        picture: "images/products/product_heels.jpg",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        old_price: 1599,
        price: 999,
        size: "8",
        color: "Black",
        Url: "https://shoppyyy.page.link/black_heels"),
    Product(
        id: '6',
        name: "Handbag",
        picture: "images/products/handbag.jpg",
        description:
            "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
        old_price: 1999,
        price: 999,
        size: "L",
        color: "Brown",
        Url: "https://shoppyyy.page.link/handbag"),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}

import 'package:flutter/material.dart';

class Product {
  final String image, title, description, type;
  final int price, size, id;
  // final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.type,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      // required this.color
      });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Nike Sportswear Club",
      type: "Fleece",
      price: 234,
      size: 12,
      description: "\$99",
      image: "images/hoodie1.png",
      // color: Color(0xFF3D82AE)
      ),
  Product(
      id: 2,
      title: "Trail Running Jacket Nike",
      type: "Windrunner",
      price: 234,
      size: 8,
      description: "\$99",
      image: "images/hoodie2.png",
      // color: Color(0xFFD3A984)
      ),
  Product(
      id: 3,
      title: "Training Top",
      type: "Nike Sport Clash",
      price: 234,
      size: 10,
      description: "\$99",
      image: "images/hoodie3.png",
      // color: Color(0xFF989493)
      ),
  Product(
      id: 4,
      title: "Trail Running Jacket Nike",
      type: "Windrunner",
      price: 234,
      size: 11,
      description: "\$99",
      image: "images/hoodie4.png",
      // color: Color(0xFFE6B398)
      ),
  
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
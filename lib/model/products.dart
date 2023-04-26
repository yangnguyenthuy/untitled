import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/api_connection/api_connection.dart';

Future<List<Products>> fetchProducts() async {
  final response = await http
      .post(Uri.parse(API.getProduct));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parseProducts(response.body);
}

// A function that converts a response body into a List<Photo>.
List<Products> parseProducts(String responseBody) {
  List<Products> products = <Products>[];

  var parsed = jsonDecode(responseBody) as List;
  parsed.forEach((element) { 
    products.add(Products.fromJson(element));
  });

  return products;
  // //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  // return parsed.map<Products>((json) => Products.fromJson(json)).toList();
}

class Products{
  int id;
  String title;
  String description;
  String image;
  double price;

  Products({required this.id, required this.title, required this.description, required this.image, required this.price});

  factory Products.fromJson(Map<String, dynamic> json) {
      var x = Products(
        id: int.parse(json['id']),
        title: json['title'],
        description: json['description'],
        image: json['image'],
        price: double.parse(json['price']),
      );
      return x;
  }

  static List<Products> init() {
    List<Products> data = [

      Products(id: 1,
          title: "Bread",
          description: "Founded as a bakery brand in Singapore in 2000 and listed on the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 2,
          title: "Coffee",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 3,
          title: "Tea",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 4,
          title: "Bread",
          description: "Tea is an aromatic ",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 5,
          title: "Coffee",
          description: "Founded as a bakery ",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 6,
          title: "milk & Tea",
          description: "Coffee is a brewed ",
          image: "assets/dish.png",
          price: 8.0),

      Products(id: 1,
          title: "Bread",
          description: "Founded as a bakery brand in Singapore in 2000 and listed on the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 2,
          title: "Coffee",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 3,
          title: "Tea",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 4,
          title: "Bread",
          description: "Tea is an aromatic ",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 5,
          title: "Coffee",
          description: "Founded as a bakery ",
          image: "assets/dish.png",
          price: 8.0),
      Products(id: 6,
          title: "milk & Tea",
          description: "Coffee is a brewed ",
          image: "assets/dish.png",
          price: 8.0),
    ];
    return data;
  }
}

// class ProductsList {
//   final List<Products> products;

//   ProductsList({
//     required this.products,
//   });

//   factory ProductsList.fromJson(List<dynamic> parsedJson) {

//     List<Products> photos = new List.empty();
//     photos = parsedJson.map((i)=>Photo.fromJson(i)).toList();
//     return new ProductsList(
//        products: photos,
       
//     );
//   }
// }

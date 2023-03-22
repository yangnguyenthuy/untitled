import 'package:flutter/material.dart';

class Products{
  int id;
  String title;
  String description;
  String image;
  double price;

  Products({this.id, this.title, this.description, this.image, this.price});

  static List<Products> init() {
    List<Products> data = [

      Products(id: 1,
          title: "Bread",
          description: "Founded as a bakery brand in Singapore in 2000 and listed on the",
          image: "assets/foodsfc_ black_coffee.png”",
          price: 8.0),
      Products(id: 2,
          title: "Coffee",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/foodsfc_black_coffee.png",
          price: 8.0),
      Products(id: 3,
          title: "Tea",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/foodsfc_black_coffee.png",
          price: 8.0),
      Products(id: 4,
          title: "Bread",
          description: "Tea is an aromatic ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Products(id: 5,
          title: "Coffee",
          description: "Founded as a bakery ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Products(id: 6,
          title: "milk & Tea",
          description: "Coffee is a brewed ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),

      Products(id: 1,
          title: "Bread",
          description: "Founded as a bakery brand in Singapore in 2000 and listed on the",
          image: "assets/foodsfc_ black_coffee.png”",
          price: 8.0),
      Products(id: 2,
          title: "Coffee",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/foodsfc_black_coffee.png",
          price: 8.0),
      Products(id: 3,
          title: "Tea",
          description: "Coffee is a brewed drink prepared from roasted coffeø beans, the",
          image: "assets/foodsfc_black_coffee.png",
          price: 8.0),
      Products(id: 4,
          title: "Bread",
          description: "Tea is an aromatic ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Products(id: 5,
          title: "Coffee",
          description: "Founded as a bakery ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
      Products(id: 6,
          title: "milk & Tea",
          description: "Coffee is a brewed ",
          image: "assets/foods/ic_black_coffee.png",
          price: 8.0),
    ];
    return data;
  }
}
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/model/products.dart';
import 'package:untitled/model/user.dart';

class Utilities {
  String url = "http://172.20.243.198/food_app_api";

  static List<Products> data = [];

  Future <List<Products>> getProducts() async {
    var res = await http.get(url as Uri);
      if (res.statusCode == 200) {
        var content = res.body;
        print(content.toString());
        var arr = json.decode(content)['food'] as List;
        return arr.map((e) => _fromJson(e)).toList();
      }
      return <Products>[];
  }

  Products _fromJson(Map<String, dynamic> item) {
    return new Products(
        id: int.parse(item['id']),
        description: item['description'],
        title: item['title'],
        image: item['image'],
        price: double.parse(item['price']));
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern = r'^(([^<>()[]\_,;:\s@"]+(_[^<>()[]\.,;:\s@"]+)")|(".+"))@(([[0-9]{1,3}.[0-9]{1,3}_[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if(!regex.hasMatch(value))
      return "Enter Valid Email";
    else
      return null;
  }

  static String? validatePassword (String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if(value.length < 8)
      return "Password should be more than 8 characters";
    else
      return null;
  }

  static String conformPassword (String value, String value2) {
    if(!equalsIgnoreCase(value, value2))
      return "Conform Password Invalid";
    return "";
  }

  static List<Products> find (String value) {
    List<Products> products = Products.init();
    List<Products> results = [];
    for(Products pro in products) {
      if(pro.title == value) results.add(pro);
    }
    return results;
  }
}


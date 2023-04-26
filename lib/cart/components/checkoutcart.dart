import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/homepage/homepage.dart';
import 'package:untitled/model/products.dart';
import 'package:untitled/model/cart.dart';

class CheckOutCart extends StatelessWidget {
  List<Products> cartdetails = Cart().getCart();
  double sum;
  CheckOutCart({required this.sum});

  Future<void> checkOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<int> id_array = <int>[];
    cartdetails.forEach((products) { id_array.add(products.id);});
    var res = await http.post(
          Uri.parse(API.checkOut),
          body: {
            "pro_id":id_array.toString(),
            "name" : prefs.getString('name'),
          }
      );
      
      var resBodyOfSignUp = jsonDecode(res.body);
      if(resBodyOfSignUp == "Success")
      {
          Fluttertoast.showToast(msg: "Checkout Success");
          cartdetails.clear();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: MaterialButton( //FlatBtn
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.green)),
              color: Colors.white,
              textColor: Colors.green,
              onPressed: () {},
              child: Text(
                "Sum:${sum}",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Expanded(child: MaterialButton( //FlatBtn
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            onPressed:() {
              checkOut(context);
            },
            color: Colors.green,
            textColor: Colors.white,
            child: Text("Check out".toUpperCase(),
                style: TextStyle(fontSize: 14)),
          ))
        ]
    );
  }
}

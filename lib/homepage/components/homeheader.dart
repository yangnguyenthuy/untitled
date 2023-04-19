import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/cart/cartpage.dart';
import 'package:untitled/search/searchpage.dart';


class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Expanded(
          child: TextField(
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage()));},
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText:"Search product",
                prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        GestureDetector(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartPage()));
          },
          child:Container(
              height:40,
              width:40,
              padding:EdgeInsets.all(10),
              child:Icon(Icons.shopping_cart_outlined)),
        )
      ],
    );
  }
}
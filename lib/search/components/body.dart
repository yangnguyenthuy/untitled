import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/homepage/components/fragment/favorite_fragment.dart';
import 'package:untitled/model/products.dart';
import 'package:untitled/model/Utilities.dart';
import 'package:flutter_tags/flutter_tags.dart';

class Body extends StatefulWidget {
  List<Products> dataProduct = <Products>[];

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _tags = [];
  List<Products> products = Products.init();
  List<Products> productsResult = <Products>[];
  late TextEditingController textEditingController;

  void initState() {
    super.initState();
    _tags.addAll(["food","categories","bread"]);
    textEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

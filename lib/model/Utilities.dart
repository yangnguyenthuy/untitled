import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';

class Utilities {
  String url = "http://192.168.0.100:3000/api/food";

  static List<Products> data = [];

  Future <List<Products>> getProducis() async {
    var res = await http.get(url);
      if (res.statusCode == 200) {
        var content = res.body;
        print(content.toString());
        var arr = json.decode(content)['food'] as List;
        return arr.map((e) => _fromJson(e)).toList();
      }
      return List<Products>();
  }

  Products _fromJson(Map<String, dynamic> item) {
    return new Products(
        description: item['description'],
        title: item['title'],
        image: item['image'],
        price: double.parse(item['price']));
  }

  static String validateEmail(String value) {
        if (value.isEmpty) {
          return 'Please enter mail';
        }
        Pattern pattern = "aaaa";
        RegExp regex = new RegExp(pattern);
        f (regex hasMatch(value))
        retum Enter Valid Ema’;
        ise.
        return nu;
        }

        static Sting valkatePassword Sting valve)
        valuesEmpty)(

        retum ‘Please enter password’;

        )

        Halve length < 8

        retum ‘Password should be more than 8 characters ';
        )
        )

        static String conformPassword{ Sting value, String value2){
        ifflequalsignoreCase(vaiue, value2)
        retum “Conform password invalid";

        )

}


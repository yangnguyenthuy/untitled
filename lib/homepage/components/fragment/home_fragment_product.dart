import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/api_connection/api_connection.dart';
import 'package:untitled/detail/productpage.dart';
import 'package:untitled/model/products.dart';
import 'package:untitled/model/utilities.dart';
import 'package:untitled/model/routes.dart';
import 'package:http/http.dart' as http;


class ProductPopular extends StatefulWidget {
  const ProductPopular({super.key});

  @override
  State<ProductPopular> createState() => _ProductPopularState();
}

class _ProductPopularState extends State<ProductPopular> {

  getProduct() async {
    var res = await http.post(Uri.parse(API.getProduct));
    return res.body;
  }

  @override
  Widget build(BuildContext context) {
        return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children : [
              Expanded(
                child: Text("Popular Products",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),),
              ),
              Text("See more",style: TextStyle(fontSize: 16,color: Colors.lightGreen),),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            child:
              FutureBuilder<List<Products>>(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return ListProduct(products: snapshot.data!);
                  }
                  if(snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading..."));
                  }
                  return Center(child: Text("Loading..."));
                },
              )
          ),
        ],
      ),
    );
  }
}
// class ProductPopular extends StatelessWidget{
//   final products = Products.init();

//   getProduct() async {
//     var res = await http.post(Uri.parse(API.getProduct));
//     return res;
//   }


//   @override
//   Widget build(BuildContext context){
//     //var productsAPI = Utilities().getProducts();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Row(
//             children : [
//               Expanded(
//                 child: Text("Popular Products",style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green
//                 ),),
//               ),
//               Text("See more",style: TextStyle(fontSize: 16,color: Colors.lightGreen),),
//             ],
//           ),
//           SizedBox(height: 10,),
//           Container(
//             child:
//               FutureBuilder(
//                 future: getProduct(),
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   if(snapshot.hasData) {
//                     return ListView.builder(

//                       itemBuilder: (context, i){
//                         return Text(snapshot.data['product'][i]['description']);
//                       },
//                     );
//                   }
//                   if(snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: Text("Loading..."));
//                   }
//                   return Center(child: Text("Loading..."));
//                 },
//               )
//             // GridView.builder(
//             //   scrollDirection: Axis.vertical,
//             //   shrinkWrap: true,
//             //   primary: false,
//             //   itemCount: products.length,
//             //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //     crossAxisCount: 3,
//             //     mainAxisSpacing: 10,
//             //     crossAxisSpacing: 10,
//             //     childAspectRatio: 0.7,
//             //   ),
//             //   itemBuilder: (context,index){
//             //     return ProductItem(
//             //       product: products[index],
//             //     );
//             //   },
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class ListProduct extends StatelessWidget {
  final List<Products> products;
  const ListProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      primary: false,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ProductItem(product: products[index],);
      },
    );
  }
}

class ProductItem extends StatelessWidget{
  Products product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context){
    if(product.image != null){

    }
    return GestureDetector(
      onTap: (){
        Utilities.data.add(product);
        Navigator.pushNamed(context, ProductPage.routeName,
            arguments: ProductDetailsArguments(product:product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.image,fit: BoxFit.fill,),
          Row(
            children: [
              Expanded(child: Text(product.title)),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.green
                ),
                child: Text(product.price.toString(),style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}

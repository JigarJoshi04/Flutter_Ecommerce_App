import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/cart.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart= [
    {
      "name": "Blue Bedsheet",
      "picture": "images/products/textile1.jpg",
      // "old_price": 600,
      "price": 99,
      "size":"XXL",
      "color":"Blue",
      "quantity":10,
    },
    {
      "name": "Red Kurta",
      "picture": "images/products/textile10.jpg",
      // "old_price": 400,
      "price": 150,
      "size":"M",
      "color":"Red",
      "quantity":12,
    },
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context,index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_qty: Products_on_the_cart[index]["quantity"],
          cart_prod_size: Products_on_the_cart[index]["size"] ,
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_picture: Products_on_the_cart[index]["picture"] ,
        );
      });
  }
}
class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty
  });
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(
///===============Leading Section===================
      leading: new Image.asset(cart_prod_picture,
      width: 80.0,
      height: 80.0,),
//==============Title Section=======================
      title: new Text(cart_prod_name),
//==============Subtitle Section=======================
      subtitle: new Column(
        children: <Widget>[
          ///Row inside the column
          new Row(children: <Widget>[
            Padding(padding: const EdgeInsets.all(0.0),
            child: new Text("Size"),),

            Padding(padding: const EdgeInsets.all(4.0),
            child: new Text(cart_prod_size),),
//========================The Section is for product color ==============
            new Padding(padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0 ,8.0),
            child: new Text(cart_prod_color),),
            new Text("Size: ")
          ],),
//==========================This Section is for the product price ==============
          new Container(
            alignment: Alignment.topLeft,
            child: new Text("\$${cart_prod_price}",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ),),
          ),
        ],
      ),
      trailing: new Column(
        children: <Widget>[
          new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
          new Text("$cart_prod_qty"),
          new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
        ],
      ),

      ),
      );
  }

}
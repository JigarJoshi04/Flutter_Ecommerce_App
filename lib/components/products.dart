import 'package:flutter/material.dart';


import 'package:flutter_ecom/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Purse",
      "picture": "images/products/accessories1.jpg",
      "old_price": 1200,
      "price": 850,
    },
    {
      "name": "Blue Bedsheet",
      "picture": "images/products/textile1.jpg",
      "old_price": 600,
      "price": 99,
    },
    {
      "name": "Sanitizer",
      "picture": "images/products/medic2.jpg",
      "old_price": 120,
      "price": 60,
    },
    {
      "name": "Green Kurta",
      "picture": "images/products/textile6.jpg",
      "old_price": 300,
      "price": 100,
    },
    {
      "name": "Red Kurta",
      "picture": "images/products/textile10.jpg",
      "old_price": 400,
      "price": 150,
    },
    {
      "name": "Bag",
      "picture": "images/products/accessories4.jpg",
      "old_price": 1000,
      "price": 800,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => new ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_new_price: prod_price,
                      product_detail_old_price: prod_old_price,
                      product_detail_picture: prod_picture,
                    ))),
                child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style:
                            TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  ),
                ))),
      ),
    );
  }
}

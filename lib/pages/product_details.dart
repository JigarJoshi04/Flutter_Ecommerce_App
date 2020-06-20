import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_old_price;
  final product_detail_new_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Text('ShopApp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {}),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16.0),),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("\$${widget.product_detail_old_price}",
                      style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),)),
                      
                      Expanded(
                        child: new Text("\$${widget.product_detail_new_price}",
                      style: TextStyle(fontWeight: FontWeight.bold,),),),],
                    ),
                  ),),
            ),
          ),
          //================The first button===============
          Row(children: <Widget>[
            //=================The size button ===============
            Expanded(child: MaterialButton(onPressed: (){},
            color: Colors.white,
            textColor: Colors.grey,
            child: Row(children: <Widget>[
              Expanded(
                child: new Text("Size"),
              ),
              Expanded(
                child: new Icon(Icons.arrow_drop_down),
              ),
            ],
            ),),
            ),

            Expanded(child: MaterialButton(onPressed: (){},
            color:Colors.white,
            textColor:  Colors.grey,
            elevation: 0.2,
            child:  Row(children: <Widget>[
              Expanded(child: new Text("Qty"),),
              Expanded(child: new Icon((Icons.arrow_drop_down)),)
            ],),),)
          ],
  ),
      Row(children: <Widget>[
        Expanded(child: MaterialButton(onPressed: (){},
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 0.2,
        child:new Text("Buy Now")
        ),
        ),
        new IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){}),
        new IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
      ],
      ),
      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:new Text("Similar Products") ,),
      
      //Similar products#################################
        Container(height: 340,
        child: Similar_products(),)
        
        ],
          ),
      );
}
}


            
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
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
        return Similar_Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod(
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
          
    
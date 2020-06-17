import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';



import 'package:flutter_ecom/components/horizontal_listview.dart';
import 'package:flutter_ecom/components/products.dart';
void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/1.jpg'),
        AssetImage('images/2.jpg'),
        AssetImage('images/ab.jpg'),
        AssetImage('images/dev.png'),
      ],
      autoplay: true,
      dotSize:4.0,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1100),
      indicatorBgPadding: 2.0,
      // dotBgColor: Colors.blue,
      dotColor: Colors.white,
    ),
  );   
    return Scaffold(
      appBar: new AppBar(
        title: Text('ShopApp'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){})
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Jigar Joshi'), 
              accountEmail: Text('jigar.pj@somaiya.edu'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              // decoration: new BoxDecoration(
              //   color: Colors.blue,
              // ), //BoxDecorator
            ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home,color: Colors.blue,),
              ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person,color: Colors.blue,),
              ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket,color: Colors.blue,),
              ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.dashboard,color: Colors.blue,),
              ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite,color: Colors.blue,),
              ),
          ),

          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings,color: Colors.blue,),
              ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About us'),
              leading: Icon(Icons.help,color: Colors.blue,),
              ),
          ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
          child:  new Text('Categories'),),
          //Horizontal  list view begins here
          HorizontalList(),

          new Padding(padding: const  EdgeInsets.all(20.0) ,
          child:  new Text('Recent Products'),),

          //Grid view
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
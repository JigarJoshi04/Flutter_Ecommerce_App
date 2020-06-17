import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/cat/textile_final.jpeg',
            image_caption: 'Textile',
          ),
          Category(
            image_location: 'images/cat/plastic_final.jpeg',
            image_caption: 'Plastic',
          ),
          Category(
            image_location: 'images/cat/hospitalSupplies_final.jpeg',
            image_caption: 'Medical',
          ),
          Category(
            image_location: 'images/cat/furniture_final.jpeg',
            image_caption: 'Furniture',
          ),
          Category(
            image_location: 'images/cat/footwear_final.jpeg',
            image_caption: 'Footwear',
          ),
          Category(
            image_location: 'images/cat/electronics_final.jpeg',
            image_caption: 'Electronics',
          ),
          Category(
            image_location: 'images/cat/sports_final.jpeg',
            image_caption: 'Sports',
          ),
          Category(
            image_location: 'images/cat/accessories_final.jpg',
            image_caption: 'Accessories',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                image_location,
                width: 100,
                height: 80,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption,style: new TextStyle(fontSize: 12.0),),
              )
            ),
          ),
        ));
  }
}

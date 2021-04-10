import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/category/dress_women.png',
            image_caption: 'Dresses',
          ),
          Category(
            image_location: 'images/category/tshirt.jpg',
            image_caption: 'Tshirt',
          ),
          Category(
            image_location: 'images/category/heels.jpg',
            image_caption: 'Footwear',
          ),
          Category(
            image_location: 'images/category/jeans.jpg',
            image_caption: 'Jeans',
          ),
          Category(
            image_location: 'images/category/traditional.jpg',
            image_caption: 'Indian',
          ),
          Category(
            image_location: 'images/category/shirt.jpg',
            image_caption: 'Formal',
          ),
          Category(
            image_location: 'images/category/kids_wear.jpeg',
            image_caption: 'Kids wear',
          ),
          Category(
            image_location: 'images/category/purse.jpg',
            image_caption: 'Purses',
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });
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
                width: 140.0,
                height: 80.0,
              ),
              subtitle: Container(
                  alignment: Alignment.topCenter, child: Text(image_caption)),
            ),
          ),
        ));
  }
}

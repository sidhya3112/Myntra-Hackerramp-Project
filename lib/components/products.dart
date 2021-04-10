import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Red Dress",
      "picture": "images/products/red_dress.jpg",
      "old_price": 1199,
      "price": 999,
      "size": "M",
      "color": "Red",
      "quantity": "1",
    },
    {
      "name": "Black Blazer",
      "picture": "images/products/blazer_black.jpg",
      "old_price": 2499,
      "price": 1499,
      "size": "L",
      "color": "Black",
      "quantity": "1",
    },
    {
      "name": "Blue Top",
      "picture": "images/products/blue_top.jpeg",
      "old_price": 1299,
      "price": 799,
      "size": "M",
      "color": "Blue",
      "quantity": "1",
    },
    {
      "name": "Party Frock",
      "picture": "images/products/girl_frock.jpg",
      "old_price": 2299,
      "price": 1299,
      "size": "S",
      "color": "Peach",
      "quantity": "1",
    },
    {
      "name": "Black Heels",
      "picture": "images/products/product_heels.jpg",
      "old_price": 1599,
      "price": 999,
      "size": "8",
      "color": "Black",
      "quantity": "1",
    },
    {
      "name": "Handbag",
      "picture": "images/products/handbag.jpg",
      "old_price": 1999,
      "price": 999,
      "size": "L",
      "color": "Brown",
      "quantity": "1",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_price: product_list[index]['price'],
            prod_old_price: product_list[index]['old_price'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_product({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails(
                      product_details_name: prod_name,
                      product_details_old_price: prod_old_price,
                      product_details_picture: prod_picture,
                      product_details_price: prod_price,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  title: Text(
                    "\Rs$prod_price",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    "\Rs$prod_old_price",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(prod_picture, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

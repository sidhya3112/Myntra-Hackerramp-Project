import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
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
    return new ListView.builder(
        itemCount: product_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Single_cart_product(
            cart_prod_name: product_list[index]["name"],
            cart_prod_color: product_list[index]["color"],
            cart_prod_picture: product_list[index]["picture"],
            cart_prod_price: product_list[index]["price"],
            cart_prod_quantity: product_list[index]["quantity"],
            cart_prod_size: product_list[index]["size"],
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
  final cart_prod_quantity;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ListTile(
          leading: new Image.asset(
            cart_prod_picture,
            width: 80,
            height: 80,
          ),
          title: new Text(cart_prod_name),
          subtitle: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  //size selection
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("Size: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      cart_prod_size,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  //color selection
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: new Text("Color: "),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      cart_prod_color,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),

              //product selection
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "Rs ${cart_prod_price}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              // Row inside column
            ],
          ),
          trailing: new Column(
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  alignment: Alignment.bottomRight,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

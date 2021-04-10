import 'package:shopping_app/widgets/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_picture;
  final product_details_price;
  final product_details_old_price;

  ProductDetails(
      {this.product_details_name,
      this.product_details_picture,
      this.product_details_old_price,
      this.product_details_price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var defaultText = TextStyle(color: Colors.black);
    var linkText = TextStyle(color: Colors.blue);
    return Scaffold(
        appBar: appBarMain(context),
        body: new ListView(
          children: <Widget>[
            new Container(
              height: 350.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_picture),
                ),
                footer: new Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: new Text(
                      widget.product_details_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    title: new Row(
                      children: <Widget>[
                        Expanded(
                          child:
                              new Text("\Rs${widget.product_details_old_price}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.lineThrough,
                                  )),
                        ),
                        Expanded(
                          child: new Text("\Rs${widget.product_details_price}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text("Size"),
                              content: new Text("Choose the size"),
                              actions: <Widget>[
                                new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ))),
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Size"),
                        ),
                        Expanded(child: new Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text("Color"),
                              content: new Text("Choose the color"),
                              actions: <Widget>[
                                new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ))),
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Color"),
                        ),
                        Expanded(child: new Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text("Quantity"),
                              content: new Text("Choose the quantity"),
                              actions: <Widget>[
                                new MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(context);
                                    },
                                    child: new Text("close",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ))),
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Qty"),
                        ),
                        Expanded(child: new Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Buy now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )),
                ),
                new IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    }),
                new IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: null)
              ],
            ),
            Divider(),
            new ListTile(
                title: new Text("Product details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                subtitle: new Text(
                    "Fashion depends on person to person. It differs based on the place, community, and, most importantly, time. The concept of Fashion is always at flux. The trends and ideas keep changing from time to time. The glamour industry, all across the world, and specifically in India, is centered around Fashion.",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Divider(),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Product name",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: new Text(widget.product_details_name))
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Product brand",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(5.0), child: new Text("Brand X"))
              ],
            ),
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Share this product: ",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    style: defaultText,
                    text: "to learn more",
                  ),
                  TextSpan(
                    style: linkText,
                    text: "Click here",
                    recognizer: TapGestureRecognizer(),
                  )
                ]))
              ],
            ),
          ],
        ));
  }
}

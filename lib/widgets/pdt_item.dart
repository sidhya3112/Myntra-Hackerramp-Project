import 'package:flutter/material.dart';
import 'pdt_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import 'cart.dart';

class PdtItem extends StatelessWidget {
  final String name;
  final String picture;
  final int price;
  final int old_price;

  PdtItem({this.name, this.picture, this.price, this.old_price});
  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          footer: Container(
            color: Colors.white70,
            child: ListTile(
              leading: Text(name, style: TextStyle(fontWeight: FontWeight.bold)
              ),
              title: Text("\Rs$price", style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
              ),
              subtitle: Text(
                "\Rs$old_price", style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough
              ),
              ),
            ),
          ),
          child: Image.asset(picture,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
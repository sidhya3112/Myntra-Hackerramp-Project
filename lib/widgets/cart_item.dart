import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartPdt extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String name;
  final String picture;
  final String size;
  final String color;

  CartPdt(this.id, this.productId, this.price, this.quantity, this.name,
      this.picture, this.size, this.color);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Container(
        height: 100,
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('Rs$price')),
            ),
            title: Text(name),
            subtitle: Text('Total: \Rs${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

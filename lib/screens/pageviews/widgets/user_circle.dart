import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:shopping_app/utils/utilities.dart';

class UserCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(0, 0, 80, 1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          Utils.getInitials(userProvider.getUser.name),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[100],
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
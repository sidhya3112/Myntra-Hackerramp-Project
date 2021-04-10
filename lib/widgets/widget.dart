import 'package:flutter/material.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/chat_home_screen.dart';
import 'package:shopping_app/widgets/cart_screen.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'https://meet.google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget appBarMain(BuildContext context) {
  // ignore: dead_code
  return AppBar(
    backgroundColor: Colors.pink,
    title: Text('Shopyyy'),
    actions: <Widget>[
      new IconButton(
          icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
      new IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new CartScreen()));
          }),
      new IconButton(
        icon: Icon(Icons.mobile_screen_share, color: Colors.white),
        onPressed: _launchURL,
      ),
      new IconButton(
          icon: Icon(Icons.voice_chat, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new ChatHomeScreen()));
          }),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget DrawerMain(BuildContext context) {
  final UserProvider userProvider = Provider.of<UserProvider>(context);
  return Drawer(
      child: new ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: userProvider.getUser?.name != null
            ? Text(userProvider.getUser.name)
            : Text("Name"),
        accountEmail: userProvider.getUser?.email != null
            ? Text(userProvider.getUser.email)
            : Text("Email"),
        currentAccountPicture: GestureDetector(
            child: new CircleAvatar(
          backgroundColor: Colors.grey,
          child: userProvider.getUser?.profilePhoto != null
              ? Image.network(userProvider.getUser.profilePhoto)
              : Icon(Icons.person, color: Colors.white),
        )),
        decoration: new BoxDecoration(color: Colors.pink),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Home Page'),
          leading: Icon(
            Icons.home,
            color: Colors.green,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('My account'),
          leading: Icon(
            Icons.person,
            color: Colors.yellow[600],
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('My orders'),
          leading: Icon(Icons.shopping_basket, color: Colors.orange),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Categories'),
          leading: Icon(
            Icons.dashboard,
            color: Colors.black,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => new CartScreen()));
        },
        child: ListTile(
          title: Text('Shopping cart'),
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Favourites'),
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ),
      Divider(),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('Settings'),
          leading: Icon(
            Icons.settings,
            color: Colors.blue,
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        child: ListTile(
          title: Text('About'),
          leading: Icon(
            Icons.help,
            color: Colors.black,
          ),
        ),
      ),
    ],
  ));
}

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/horizontal_list.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:shopping_app/screens/callscreens/pickup/pickup_layout.dart';
import 'package:shopping_app/widgets/widget.dart';
import 'package:shopping_app/widgets/all_pdts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = new Container(
        height: 250.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/screen1_1.jpg'),
            AssetImage('images/screen1_2.jpg'),
            AssetImage('images/screen1_3.jpg'),
            AssetImage('images/screen1_4.jpg'),
            AssetImage('images/screen1_5.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          indicatorBgPadding: 4.0,
        ));
    return  Scaffold(
        appBar: appBarMain(context),
        drawer: DrawerMain(context),
        body: new ListView(children: <Widget>[
          //image_carousel begins from here
          image_carousel,
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text('Categories', style: TextStyle(fontSize: 18)),
          ),
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: new Text('Recent products', style: TextStyle(fontSize: 18)),
          ),
          Container(
            height: 320.0,
            child: AllProducts(),
          )
        ]),
    );
  }
}

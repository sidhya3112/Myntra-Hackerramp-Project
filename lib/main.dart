import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/provider/image_upload_provider.dart';
import 'package:shopping_app/provider/user_provider.dart';
import 'package:shopping_app/resources/firebase_repository.dart';
import 'package:shopping_app/screens/login_screen.dart';
import 'package:shopping_app/screens/search_screen.dart';
import 'package:shopping_app/widgets/orders.dart';
import 'package:shopping_app/widgets/cart.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/widgets/pdt_detail_screen.dart';
import 'package:shopping_app/widgets/cart_screen.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/widgets/red_dress.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseRepository _repository = FirebaseRepository();

  @override
  void initState() {
    super.initState();
    this.initDynamicLinks();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      print(deepLink.path);
      Navigator.pushNamed(context, '/red_dress');
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            print(deepLink.path);
            Navigator.pushNamed(context, deepLink.path);
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );
  }

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: "Shoppyy",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
          '/search_screen': (context) => SearchScreen(),
          '/red_dress': (BuildContext context) => RedDress(),
        },
        home: FutureBuilder(
        future: _repository.getCurrentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.hasData) {
            return HomeScreen();
          }
          else{
            return LoginScreen();
          }
          },
        ),
      ),
    );
  }
}

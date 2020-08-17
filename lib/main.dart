import 'package:city_store/log-in.dart';
import 'package:city_store/shops.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cart.dart';
import 'profile.dart';
import 'home.dart';
import 'personal-info.dart';
import 'splash.dart';
import 'market-page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Stores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _currentIndex=0;
 List<Widget> _pages;
  @override
  void initState() {
    _pages = [
      Home(),
      Cart(),
      Shops()
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages==null?CircularProgressIndicator():_pages[_currentIndex],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData:Icons.home,title: 'Home'),
            TabData(iconData:Icons.favorite,title: 'Favorite'),
            TabData(iconData:Icons.shop,title: 'Shops'),
          ],
         initialSelection: 0,
         circleColor: Colors.black,
         inactiveIconColor: Colors.black,
         onTabChangedListener: (position){
            setState(() {
              _currentIndex=position;
            });
         },
        )
    );
  }
}
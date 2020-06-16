import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'market-page.dart';
import 'const.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 250,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
//                        image: DecorationImage(
//                          image: AssetImage('assets/images/ecommerce.png'),
//                          fit: BoxFit.fill,
//                        ),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(100))),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.black,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100),
                                      bottomRight: Radius.circular(100))),
                            ),
                          ),
                        )
                      ],
                    ),
                    //markets
                    Positioned(
                        top: 150,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              child: Swiper(
                                itemCount: 4,
                                loop: true,
                                scale: 0.6,
                                autoplay: true,
                                viewportFraction: 0.6,
                                pagination: SwiperPagination(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Container(
                                        height:350,
                                        width: 200,
                                        child: GestureDetector(
                                          onTap: () {
                                            Duration(seconds: 2);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Market(
                                                      market: index,
                                                    )));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/download${index + 1}.jpg'),
                                                fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(40)),
                                      ));
                                },
                              ),
                            ),
                          ],
                        )),
                   //app bar
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //menu Icon
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            //Search
                            Container(
                              height: 30,
                              width: 110,
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30))),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: User.UserImage==null?AssetImage('assets/images/person.jpg'):NetworkImage(User.UserImage),
                            )
                          ],
                        ),
                      ),
                    ),
                    // user name
                    Positioned(
                      top: 60,
                      left: 30,
                      child: Text(
                        User.UserName==null?"Hi,Dear..":"Hi,${User.UserName}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ),
                   //welcome
                    Positioned(
                      top: 100,
                      left: 30,
                      child: Text(
                        "Welcome to City Store",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

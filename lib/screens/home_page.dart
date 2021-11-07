// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/model/Chair.dart';
import 'package:gap/gap.dart';

import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentPage = 0;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        inactiveIconColor: Color(0xffA09DAC),
        circleColor: Color(0xffFA533C),
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.shopping_bag, title: "Shopping"),
          TabData(iconData: Icons.star, title: "Star"),
          TabData(iconData: Icons.person, title: "Profile")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Furniture',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Gap(8),
                  Text(
                    'Perfect Choice!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Gap(24),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      style: TextStyle(fontSize: 12, height: 1),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search, size: 28,),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 25, minWidth: 50),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(16),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.list),
                  ),
                ],
              ),
            ),

            Gap(24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 35,
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Color(0xff403B58),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffA3ACC7),
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: 0)
                      ]),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      text: 'All',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Chair',
                    ),
                    Tab(
                      text: 'Table',
                    ),

                    // second tab [you can add an icon using the icon property]
                    Tab(
                      text: 'Lamp',
                    ),
                    Tab(
                      text: 'Floor',
                    ),
                  ],
                ),
              ),
            ),

            Gap(24),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Stack(
                    children: [
                      Container(
                        child: ListView.builder(
                          itemCount: chairList.length,
                            itemBuilder: (context, index){
                            return FurnitureItem(
                              chairList[index]
                            );

                        })
                      ),
                      _buildBottomGradient()
                    ],
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Chair',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Table',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Lamp',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Floor',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _buildBottomGradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffF0EFF0).withOpacity(0.1), Color(0xffF0EFF0).withOpacity(0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}

class FurnitureItem extends StatelessWidget {
  final Chair chairDetails;


  const FurnitureItem(this.chairDetails);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
           MaterialPageRoute(builder: (builder)=> DetailScreen(chairDetails: chairDetails))
          /*PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DetailScreen(chairDetails: chairDetails);
            },```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
            transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return Align(
                child: SlideTransition(
                 // opacity: animation,
                  position:offsetAnimation,
                  child: child,
                ),
              );
            },
          ),*/
        );

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        height: 170,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA3ACC7),
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  spreadRadius: 2)
            ]),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: 150,
                margin: EdgeInsets.only(right: 16),
                //padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xffF2EDED),
                ),
                child: Stack(
                  children: [
                    Container(),
                    Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: 'image',
                        child: Image.asset(chairDetails.image,),
                      ),
                    ),

                    Positioned(
                      top: 5,
                      right: 10,

                      child: Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color(0xffFA523C),
                          size: 12,
                        ),


                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chairDetails.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        Gap(4),
                        Text(
                          'by ${chairDetails.author}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    chairDetails.subtitle,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: chairDetails.price,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              children: [
                            TextSpan(
                              text: '.00',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            )
                          ])),
                      Container(
                        height: 30,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff403B58),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffA3ACC7),
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  spreadRadius: 0)
                            ]),
                        child: Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

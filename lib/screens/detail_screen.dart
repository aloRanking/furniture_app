// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/model/Chair.dart';
import 'package:gap/gap.dart';

class DetailScreen extends StatefulWidget {
  final Chair chairDetails;
  DetailScreen({Key? key, required this.chairDetails}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
      },

                    child: Container(
                      width: 30,
                        height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),


                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                        Icons.favorite,
                      color: Color(0xffFA523C),
                      size: 18,
                    ),


                  )
                ],
              ),
            ),
            Gap(24),

            /*SizedBox(
              height: 150,
            ),*/
            Hero(
              tag: 'image${widget.chairDetails.id}',
              child: Image.asset(widget.chairDetails.image,
              height: 180,),
            ),

            Gap(16),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),

              ),

              child: Column(
                children: [
                  Container(
                    margin:const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.chairDetails.title,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700
                                  ),),
                                Gap(4),
                                Text('by ${widget.chairDetails.author}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w600
                                  ),),
                              ],
                            ),

                            Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black26.withOpacity(0.2)
                                )
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, size: 18,
                                  color: Colors.yellow,),
                                  Gap(4),
                                  const Text('4.7',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700
                                    ),),
                                ],
                              ),
                            )
                          ],
                        ),
                        Gap(24),
                        Text(widget.chairDetails.details),
                        Gap(24),
                        Row(
                          children: [
                            DetailItem(),
                            Gap(8),
                            DetailItem(),
                            Gap(8),
                            DetailItem(),



                          ],
                        ),
                        Gap(24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Color',
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        )),
                                Gap(8),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff7D1A00),
                                  ),
                                ),
                                Gap(8),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                Gap(8),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff495198),
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffF4F3F4),

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      if(count>1){
                                        setState(() {
                                          count--;
                                        });
                                      }

                                    },
                                    child: Text('-',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                  Gap(8),
                                  Text('$count',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600
                                      )),
                                  Gap(8),
                                  GestureDetector(
                                    onTap:(){

                                        setState(() {
                                          count++;
                                        });

                                    },
                                    child: Text('+',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600
                                        )),
                                  ),

                                ],
                              ),
                            )

                          ],
                        )

                      ],
                    ),
                  ),

                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color(0xffEFEEF0),
                  ),
                  Gap(24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        RichText(text: TextSpan(
                            text: widget.chairDetails.price,
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                            ),
                            children: [
                              TextSpan(
                                text: '.00',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
                                ),

                              )
                            ]
                        )),

                        Container(
                          height: 50,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xffFA543B),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffA3ACC7),
                                    offset: Offset(0,3),
                                    blurRadius: 5,
                                    spreadRadius: 0
                                )
                              ]
                          ),
                          child: Text("Buy now",
                            style: TextStyle(
                              color: Colors.white,

                            ),),

                        )
                      ],
                    ),
                  )
                ],
              ),
            )




          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xffF2EDED),
            borderRadius: BorderRadius.circular(16),

        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xff74eded),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("23",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            "Post",
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 0.4,
                            ),
                          ),
                      ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            "1.5M",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            "234",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(
                              letterSpacing: 0.4,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),

                    ],
                  )
                ],
              ),
              SizedBox(),
              Text(""),
              SizedBox(),
              Text(""),
              SizedBox(),
              actions(context),
              SizedBox(),
              Container()
            ],
          ),
      )
  );
}

Widget actions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [],
  );
}
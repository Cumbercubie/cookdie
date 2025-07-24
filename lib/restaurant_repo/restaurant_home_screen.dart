import 'package:cookdie/restaurant_repo/profile_header_widget.dart';
import 'package:flutter/material.dart';

class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({super.key});

  @override
  State<RestaurantHomeScreen> createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200]!,
                  )
              )
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Text("john.doe", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () => print("Add"),
                  icon: Icon(
                      Icons.add_box_outlined,
                      color: Colors.black
                  ),
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => print("Menu"),
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder: (context,_) {
                return [
                  SliverList(delegate: SliverChildListDelegate([
                    profileHeaderWidget(context),
                  ],),),
                ];
              },
              body: Column(
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[400],
                      indicatorWeight: 1,
                      indicatorColor: Colors.black,
                      tabs: [
                        Tab(
                          icon: Icon(
                                Icons.grid_on_sharp,
                                color: Colors.black,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                              Icons.tv,
                              color: Colors.black
                          ),
                        ),
                        Tab(
                          icon: Icon(
                              Icons.tag_faces,
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(child: TabBarView(children: [
                  // ]))
                ],
              )
          ),
       ),
    );
  }
}

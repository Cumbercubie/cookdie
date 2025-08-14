import 'package:flutter/material.dart';

class AddFoodPhotoScreen extends StatefulWidget {
  const AddFoodPhotoScreen({super.key});

  @override
  State<AddFoodPhotoScreen> createState() => _AddFoodPhotoScreenState();
}

class _AddFoodPhotoScreenState extends State<AddFoodPhotoScreen> {
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
            ))),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text(
                "Restaurant",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [TextButton(onPressed: () {}, child: Text("Next"))],
            ),
          )),
    );
  }
}

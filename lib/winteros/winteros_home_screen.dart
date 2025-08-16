
import 'package:cookdie/winteros/stable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinterosHomeScreen extends StatefulWidget {
  const WinterosHomeScreen({super.key});

  @override
  State<WinterosHomeScreen> createState() => _WinterosHomeScreenState();
}

class _WinterosHomeScreenState extends State<WinterosHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Winteros"),
      ),
      body: Column(
        children: [
          StableParkingWidget()
        ],
      ),
    );
  }
}

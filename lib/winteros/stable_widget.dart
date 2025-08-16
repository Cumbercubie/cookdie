import 'package:cookdie/winteros/swipable.dart';
import 'package:flutter/material.dart';

class StableParkingWidget extends StatefulWidget {
  const StableParkingWidget({super.key});

  @override
  State<StableParkingWidget> createState() => _StableParkingWidgetState();
}

class _StableParkingWidgetState extends State<StableParkingWidget> {
  int selectedNumber = 0;
  bool isLeft = true;
  final double fontSize = 50.0;
  final FixedExtentScrollController numberController =
  FixedExtentScrollController(initialItem: 11);
  int directionAnim = 0; // -1 = left, +1 = right

  void toggleDirection(bool toLeft) {
    setState(() {
      directionAnim = toLeft ? -1 : 1;
      isLeft = toLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //   Car icon
            Container(
              padding: EdgeInsets.all(8), // optional, for spacing around the icon
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // rounded corners
                color: Colors.red
              ),
              child: Icon(
                Icons.directions_car,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 16),
          //   Parking Number
            SizedBox(
              height: 100,
              width: 60,
              child: ListWheelScrollView.useDelegate(
                  controller: numberController,
                  itemExtent: 80,
                  onSelectedItemChanged: (index) {
                    setState(() => selectedNumber = 11 - index);
                    print(selectedNumber);
                  },
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 11,
                      builder: (context, index) => Center(
                        child: Text(
                          (11-index).toString(),
                          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w900),
                        ),
                      ),
                  ),
              ),
            ),
              SizedBox(width: 16),
              SwipeTextSwitcher(
                originalText: "LEFT",
                revealedText: "RIGHT",
              ),
          ],
        ),
      ],
    );
  }
}

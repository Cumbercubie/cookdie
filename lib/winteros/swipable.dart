import 'package:flutter/material.dart';

class SwipeTextSwitcher extends StatefulWidget {
  final String originalText;
  final String revealedText;

  const SwipeTextSwitcher({
    Key? key,
    required this.originalText,
    required this.revealedText,
  }) : super(key: key);

  @override
  _SwipeTextSwitcherState createState() => _SwipeTextSwitcherState();
}

class _SwipeTextSwitcherState extends State<SwipeTextSwitcher> {
  bool _revealed = false;
  double _dragX = 0;
  bool isLeft = true;

  static const textStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 35,
    color: Colors.white
  );
  void _onDragEnd() {
    // Only reveal if swiped in allowed direction past threshold
    if ((isLeft && _dragX > 50) || (!isLeft && _dragX < -50)) {
      setState(() => _revealed = !_revealed);
      setState(() {
        isLeft =  !isLeft;

      });
    }
    setState(() => _dragX = 0); // reset drag
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 120,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // background
            Container(color: isLeft ? Colors.green : Colors.red),
            // swipeable text
            GestureDetector(
              onHorizontalDragUpdate: (details) {
              setState(() {
                double delta = details.primaryDelta ?? 0;
                // restrict drag to only the allowed direction
                if (isLeft && delta > 0) {
                  _dragX += delta; // left-to-right
                } else if (!isLeft && delta < 0) {
                  _dragX += delta; // right-to-left
                }

              });

              },
              onHorizontalDragEnd: (_) => _onDragEnd(),
              child: Stack(
                children: [
                  // original text
                  Transform.translate(
                    offset: Offset(
                      _revealed
                          ? (isLeft ? screenWidth : -screenWidth)
                          : _dragX,
                      0,
                    ),
                    child: Container(
                      width: screenWidth,
                      alignment: Alignment.center,
                      child: Text(widget.originalText,
                          style: textStyle),
                    ),
                  ),
                  // revealed text
                  Transform.translate(
                    offset: Offset(
                      _revealed
                          ? _dragX
                          : (isLeft ? -screenWidth : screenWidth),
                      0,
                    ),
                    child: Container(
                      width: screenWidth,
                      alignment: Alignment.center,
                      child: Text(widget.revealedText,
                          style: textStyle
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
}

import 'dart:math';

import 'package:flutter/material.dart';

class PageBackground extends StatefulWidget {
  const PageBackground({super.key});

  @override
  State<PageBackground> createState() => _PageBackgroundState();
}

class _PageBackgroundState extends State<PageBackground> {
  final List<Rect> usedRectangles = [];
  final List<Rect> shownRectangles = [];
  final List<double> blurs = [];

  @override
  void didChangeDependencies() {
    _generateRandomCircles();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: List.generate(3, (index) {
          return Positioned(
            left: shownRectangles[index].left,
            top: shownRectangles[index].top,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.8),
                    spreadRadius: blurs[index],
                    blurRadius: blurs[index],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _generateRandomCircles() {
    final random = Random();

    for (int i = 0; i < 3; i++) {
      late Rect rectangle;
      late double blur;
      int attempt = 0;

      usedRectangles.clear();

      while (attempt < 10) {
        blur = random.nextDouble() * 100 + 80;

        final position = Offset(
          random.nextDouble() * MediaQuery.of(context).size.width,
          random.nextDouble() * MediaQuery.of(context).size.height,
        );

        rectangle = Rect.fromCircle(center: position, radius: blur / 2);

        if (!_isRectangleTooClose(rectangle)) {
          usedRectangles.add(rectangle);
          shownRectangles.add(rectangle);
          blurs.add(blur);
          break;
        }

        attempt++;
      }
    }
  }

  bool _isRectangleTooClose(Rect newRectangle) {
    for (var usedRectangle in usedRectangles) {
      if (usedRectangle.overlaps(newRectangle)) {
        return true;
      }
    }
    return false;
  }
}

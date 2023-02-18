import 'dart:math';

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  double _size = 100.0;
  Color _color = Colors.blue;
  bool _isRotated = false;

  void _onButtonPressed() {
    setState(() {
      _size = Random().nextDouble() * 200 + 50;
      _color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1);
      _isRotated = !_isRotated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: _size,
                width: _size,
                color: _color,
                child: const Text(
                  'Container animado',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: _onButtonPressed,
                child: CustomPaint(
                  painter: MyPainter(_isRotated),
                  child: const SizedBox(
                    height: 200,
                    width: 200,
                    child: Center(
                      child: Text(
                        'Custom Paint',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final bool isRotated;

  MyPainter(this.isRotated);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    if (isRotated) {
      canvas.rotate(pi / 4);
    }

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

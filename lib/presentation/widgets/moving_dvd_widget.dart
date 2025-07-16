import 'dart:async';
import '../../domain/entities/dvd_entity.dart';
import 'package:flutter/material.dart';

class MovingDvdWidget extends StatefulWidget {
  final DvdEntity dvdEntity;
  final Size screenSize;

  // Constants for the DVD logo size
  static const double dvdWidth = 150.0;
  static const double dvdHeight = 70.0;

  const MovingDvdWidget({
    Key? key,
    required this.dvdEntity,
    required this.screenSize,
  }) : super(key: key);

  @override
  State<MovingDvdWidget> createState() => _MovingDvdWidgetState();
}

class _MovingDvdWidgetState extends State<MovingDvdWidget> {
  late Offset position;
  late Offset velocity;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    position = widget.dvdEntity.initialPosition;
    velocity = widget.dvdEntity.velocity;

    // Start the animation loop
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      _updatePosition();
    });
  }

  void _updatePosition() {
    setState(() {
      // Calculate new position
      position += velocity;

      // Bounce off walls
      if (position.dx <= 0 ||
          position.dx >= widget.screenSize.width - MovingDvdWidget.dvdWidth) {
        velocity = Offset(-velocity.dx, velocity.dy);
      }
      if (position.dy <= 0 ||
          position.dy >= widget.screenSize.height - MovingDvdWidget.dvdHeight) {
        velocity = Offset(velocity.dx, -velocity.dy);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // IMPORTANT: Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Image.asset(
        widget.dvdEntity.image,
        width: MovingDvdWidget.dvdWidth,
        height: MovingDvdWidget.dvdHeight,
      ),
    );
  }
}

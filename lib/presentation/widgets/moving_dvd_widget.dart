import 'dart:async';
import 'dart:math'; // Import math for the Random class
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
  late String currentImage;
  Timer? _timer;

  final _random = Random();
  final List<String> dvd_images = const [
    'assets/dvd-black.png',
    'assets/dvd-blue.png',
    'assets/dvd-green.png',
    'assets/dvd-purple.png',
    'assets/dvd-red.png',
    'assets/dvd-yellow.png',
  ];

  @override
  void initState() {
    super.initState();
    position = widget.dvdEntity.initialPosition;
    velocity = widget.dvdEntity.velocity;

    currentImage = widget.dvdEntity.image;

    // Start the animation loop
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      _updatePosition();
    });
  }

  void _changeDvdImage() {
    String newImage;
    do {
      newImage = dvd_images[_random.nextInt(dvd_images.length)];
    } while (newImage == currentImage);

    currentImage = newImage;
  }

  void _updatePosition() {
    setState(() {
      position += velocity;

      bool bounced = false;

      // Bounce off walls
      if (position.dx <= 0 ||
          position.dx >= widget.screenSize.width - MovingDvdWidget.dvdWidth) {
        velocity = Offset(-velocity.dx, velocity.dy);
        bounced = true;
      }
      if (position.dy <= 0 ||
          position.dy >= widget.screenSize.height - MovingDvdWidget.dvdHeight) {
        velocity = Offset(velocity.dx, -velocity.dy);
        bounced = true;
      }

      if (bounced) {
        _changeDvdImage();
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
        currentImage,
        width: MovingDvdWidget.dvdWidth,
        height: MovingDvdWidget.dvdHeight,
      ),
    );
  }
}

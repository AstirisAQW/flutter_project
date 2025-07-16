import 'dart:math';
import '../entities/dvd_entity.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddDvdUseCase {
  final Uuid _uuid;

  final List<String> dvd_images = [
    'assets/dvd-black.png',
    'assets/dvd-blue.png',
    'assets/dvd-green.png',
    'assets/dvd-purple.png',
    'assets/dvd-red.png',
    'assets/dvd-yellow.png',
  ];

  AddDvdUseCase(this._uuid);

  DvdEntity call({required Size screenSize}) {
    final random = Random();

    // Random starting position within screen bounds
    final startX = random.nextDouble() * (screenSize.width - 150);
    final startY = random.nextDouble() * (screenSize.height - 80);

    final vx =
        (random.nextBool() ? 1.0 : -1.0) *
        (random.nextDouble() * 2 + 1.5); // Speed between 1.5 and 3.5
    final vy =
        (random.nextBool() ? 1.0 : -1.0) * (random.nextDouble() * 2 + 1.5);

    final getRandomImage = dvd_images[random.nextInt(dvd_images.length)];

    return DvdEntity(
      id: _uuid.v4(),
      initialPosition: Offset(startX, startY),
      velocity: Offset(vx, vy),
      image: getRandomImage,
    );
  }
}

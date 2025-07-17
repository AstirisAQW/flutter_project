import 'dart:math';
import 'dart:ui';
import 'package:uuid/uuid.dart';
import '../../entities/dvd_entity.dart';

class AddDvdUseCase {
  final Uuid _uuid;
  final Random _random = Random();

  static const List<String> _dvdImages = [
    'assets/images/dvd-black.png',
    'assets/images/dvd-blue.png',
    'assets/images/dvd-green.png',
    'assets/images/dvd-purple.png',
    'assets/images/dvd-red.png',
    'assets/images/dvd-yellow.png',
  ];

  static const double _dvdWidth = 150.0;
  static const double _dvdHeight = 70.0;

  AddDvdUseCase(this._uuid);

  DvdEntity call({required double screenWidth, required double screenHeight}) {
    final startX = _random.nextDouble() * (screenWidth - _dvdWidth);
    final startY = _random.nextDouble() * (screenHeight - _dvdHeight);

    final vx =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);
    final vy =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);

    final randomImage = _dvdImages[_random.nextInt(_dvdImages.length)];

    return DvdEntity(
      id: _uuid.v4(),
      initialPosition: Offset(startX, startY),
      velocity: Offset(vx, vy),
      image: randomImage,
    );
  }
}

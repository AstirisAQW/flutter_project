import 'dart:math';
import 'dart:ui';
import 'package:uuid/uuid.dart';
import '../../entities/horse_entity.dart';

class AddHorseUseCase {
  final Uuid _uuid;
  final Random _random = Random();

  static const double _horseWidth = 300.0;
  static const double _horseHeight = 300.0;

  AddHorseUseCase(this._uuid);

  HorseEntity call({
    required double screenWidth,
    required double screenHeight,
    required String image, // New parameter
    required String sound, // New parameter
  }) {
    final startX = _random.nextDouble() * (screenWidth - _horseWidth);
    final startY = _random.nextDouble() * (screenHeight - _horseHeight);

    final vx =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);
    final vy =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);

    return HorseEntity(
      id: _uuid.v4(),
      initialPosition: Offset(startX, startY),
      velocity: Offset(vx, vy),
      image: image, // Use the parameter
      sound: sound, // Use the parameter
    );
  }
}
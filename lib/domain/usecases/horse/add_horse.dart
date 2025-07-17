import 'dart:math';
import 'dart:ui';
import 'package:uuid/uuid.dart';
import '../../entities/horse_entity.dart';

class AddHorseUseCase {
  final Uuid _uuid;
  final Random _random = Random();

  static const double _horseWidth = 70.0;
  static const double _horseHeight = 70.0;

  AddHorseUseCase(this._uuid);

  HorseEntity call({
    required double screenWidth,
    required double screenHeight,
  }) {
    final startX = _random.nextDouble() * (screenWidth - _horseWidth);
    final startY = _random.nextDouble() * (screenHeight - _horseHeight);

    final vx =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);
    final vy =
        (_random.nextBool() ? 1.0 : -1.0) * (_random.nextDouble() * 2 + 1.5);

    final horseImage = 'assets/images/haru_urara.png';
    final horseSound = 'sounds/haru_urara_sound.wav';
    return HorseEntity(
      id: _uuid.v4(),
      initialPosition: Offset(startX, startY),
      velocity: Offset(vx, vy),
      image: horseImage,
      sound: horseSound,
    );
  }
}

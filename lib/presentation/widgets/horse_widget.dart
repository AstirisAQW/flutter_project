import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/horse_entity.dart';

class HorseWidget extends StatefulWidget {
  final HorseEntity horseEntity;
  final Size screenSize;

  static const double horseWidth = 70.0;
  static const double horseHeight = 70.0;

  const HorseWidget({
    super.key,
    required this.horseEntity,
    required this.screenSize,
  });

  @override
  State<HorseWidget> createState() => _HorseWidgetState();
}

class _HorseWidgetState extends State<HorseWidget> {
  late Offset position;
  late Offset velocity;
  Timer? _timer;
  
  // Create an instance of the audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    position = widget.horseEntity.initialPosition;
    velocity = widget.horseEntity.velocity;

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (mounted) {
        _updatePosition();
      }
    });
  }

  void _playSound() {
    // Play the sound from the assets
    _audioPlayer.play(AssetSource(widget.horseEntity.sound));
  }

  void _updatePosition() {
    setState(() {
      position += velocity;
      bool bounced = false;

      if (position.dx <= 0 || position.dx >= widget.screenSize.width - HorseWidget.horseWidth) {
        velocity = Offset(-velocity.dx, velocity.dy);
        bounced = true;
      }

      if (position.dy <= 0 || position.dy >= widget.screenSize.height - HorseWidget.horseHeight) {
        velocity = Offset(velocity.dx, -velocity.dy);
        bounced = true;
      }
      
      if (bounced) {
        _playSound();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose(); // Release player resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Image.asset(
        widget.horseEntity.image,
        width: HorseWidget.horseWidth,
        height: HorseWidget.horseHeight,
      ),
    );
  }
}
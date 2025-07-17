import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HorseEntity extends Equatable {
  final String id;
  final Offset initialPosition;
  final Offset velocity;
  final String image;
  final String sound;

  const HorseEntity({
    required this.id,
    required this.initialPosition,
    required this.velocity,
    required this.image,
    required this.sound,
  });

  @override
  List<Object?> get props => [id, initialPosition, velocity, image, sound];
}
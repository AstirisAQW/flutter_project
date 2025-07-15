import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DvdEntity extends Equatable {
  final String id;
  final Offset initialPosition;
  final Offset velocity;

  const DvdEntity({
    required this.id,
    required this.initialPosition,
    required this.velocity,
  });

  @override
  List<Object?> get props => [id, initialPosition, velocity];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HorseEvent extends Equatable {
  const HorseEvent();

  @override
  List<Object> get props => [];
}

class AddHorse extends HorseEvent {
  final Size screenSize;
  final String image;
  final String sound;

  const AddHorse({
    required this.screenSize,
    required this.image,
    required this.sound,
  });

  @override
  List<Object> get props => [screenSize, image, sound];
}

class DeleteHorse extends HorseEvent {}
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HorseEvent extends Equatable {
  const HorseEvent();

  @override
  List<Object> get props => [];
}

class AddHorse extends HorseEvent {
  final Size screenSize;

  const AddHorse({required this.screenSize});

  @override
  List<Object> get props => [screenSize];
}

class DeleteHorse extends HorseEvent {}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DvdEvent extends Equatable {
  const DvdEvent();

  @override
  List<Object> get props => [];
}

// Event to trigger adding a new DVD
class AddDvd extends DvdEvent {
  final Size screenSize;

  const AddDvd({required this.screenSize});

  @override
  List<Object> get props => [screenSize];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DvdEvent extends Equatable {
  const DvdEvent();

  @override
  List<Object> get props => [];
}

class AddDvd extends DvdEvent {
  final Size screenSize;

  const AddDvd({required this.screenSize});

  @override
  List<Object> get props => [screenSize];
}

class DeleteDvd extends DvdEvent {}

class DeleteAllDvds extends DvdEvent {}

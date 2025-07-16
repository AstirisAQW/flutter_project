import 'package:equatable/equatable.dart';
import '../../domain/entities/dvd_entity.dart';

abstract class DvdState extends Equatable {
  const DvdState();

  @override
  List<Object> get props => [];
}

class DvdInitial extends DvdState {}

class DvdLoaded extends DvdState {
  final List<DvdEntity> dvds;

  const DvdLoaded({required this.dvds});

  @override
  List<Object> get props => [dvds];
}

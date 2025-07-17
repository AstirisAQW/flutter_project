import 'package:equatable/equatable.dart';
import '../../../domain/entities/horse_entity.dart';

abstract class HorseState extends Equatable {
  const HorseState();

  @override
  List<Object> get props => [];
}

class HorseInitial extends HorseState {}

class HorseLoaded extends HorseState {
  final List<HorseEntity> horse;

  const HorseLoaded({required this.horse});

  @override
  List<Object> get props => [horse];
}

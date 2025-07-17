import 'package:equatable/equatable.dart';
import '../../entities/horse_entity.dart';

class DeleteHorseUseCase {
  List<HorseEntity> call(DeleteHorseParams params) {
    if (params.horse.isEmpty) {
      return [];
    }
    return List<HorseEntity>.from(params.horse)..removeLast();
  }
}

class DeleteHorseParams extends Equatable {
  final List<HorseEntity> horse;

  const DeleteHorseParams({required this.horse});

  @override
  List<Object?> get props => [horse];
}

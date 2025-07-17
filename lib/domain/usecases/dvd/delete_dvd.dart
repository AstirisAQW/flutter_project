import 'package:equatable/equatable.dart';
import '../../entities/dvd_entity.dart';

class DeleteDvdUseCase {
  List<DvdEntity> call(DeleteDvdParams params) {
    if (params.dvds.isEmpty) {
      return [];
    }
    return List<DvdEntity>.from(params.dvds)..removeLast();
  }
}

class DeleteDvdParams extends Equatable {
  final List<DvdEntity> dvds;

  const DeleteDvdParams({required this.dvds});

  @override
  List<Object?> get props => [dvds];
}

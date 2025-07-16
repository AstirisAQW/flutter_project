import 'package:equatable/equatable.dart';
import 'usecase.dart';
import 'package:flutter_project/domain/entities/dvd_entity.dart';

class DeleteDvdUseCase implements UseCase<List<DvdEntity>, DeleteDvdParams> {
  @override
  List<DvdEntity> call(DeleteDvdParams params) {
    if (params.dvds.isEmpty) {
      return []; // Return an empty list if there's nothing to remove.
    }
    final updatedList = List<DvdEntity>.from(params.dvds);
    updatedList.removeLast();
    return updatedList;
  }
}

class DeleteDvdParams extends Equatable {
  final List<DvdEntity> dvds;

  const DeleteDvdParams({required this.dvds});

  @override
  List<Object?> get props => [dvds];
}

import 'usecase.dart';
import 'package:flutter_project/domain/entities/dvd_entity.dart';

class DeleteAllDvdsUseCase implements UseCase<List<DvdEntity>, NoParams> {
  @override
  List<DvdEntity> call(NoParams params) {
    return [];
  }
}

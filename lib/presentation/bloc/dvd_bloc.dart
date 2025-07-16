import 'package:bloc/bloc.dart';
import '../../domain/entities/dvd_entity.dart';
import '../../domain/usecases/add_dvd.dart';
import '../../domain/usecases/deleteAll_dvd.dart';
import '../../domain/usecases/delete_dvd.dart';
import '../../domain/usecases/usecase.dart';
import 'dvd_event.dart';
import 'dvd_state.dart';

class DvdBloc extends Bloc<DvdEvent, DvdState> {
  final AddDvdUseCase addDvdUseCase;
  final DeleteDvdUseCase deleteDvdUseCase;
  final DeleteAllDvdsUseCase deleteAllDvdsUseCase;

  DvdBloc({
    required this.addDvdUseCase,
    required this.deleteDvdUseCase,
    required this.deleteAllDvdsUseCase,
  }) : super(DvdInitial()) {
    on<AddDvd>(_onAddDvd);
    on<DeleteDvd>(_onDeleteDvd);
    on<DeleteAllDvds>(_onDeleteAllDvds);
  }

  void _onAddDvd(AddDvd event, Emitter<DvdState> emit) {
    final currentDvds = state is DvdLoaded
        ? (state as DvdLoaded).dvds
        : <DvdEntity>[];
    final newDvd = addDvdUseCase(screenSize: event.screenSize);
    emit(DvdLoaded(dvds: List.from(currentDvds)..add(newDvd)));
  }

  void _onDeleteDvd(DeleteDvd event, Emitter<DvdState> emit) {
    if (state is DvdLoaded) {
      final currentDvds = (state as DvdLoaded).dvds;

      // Call the use case with the current list
      final updatedList = deleteDvdUseCase(DeleteDvdParams(dvds: currentDvds));

      if (updatedList.isEmpty) {
        emit(DvdInitial());
      } else {
        emit(DvdLoaded(dvds: updatedList));
      }
    }
  }

  void _onDeleteAllDvds(DeleteAllDvds event, Emitter<DvdState> emit) {
    deleteAllDvdsUseCase(NoParams());
    emit(DvdInitial());
  }
}

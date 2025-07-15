import 'package:bloc/bloc.dart';
import '../../domain/usecases/add_dvd.dart';
import '../../presentation/bloc/dvd_event.dart';
import '../../presentation/bloc/dvd_state.dart';

class DvdBloc extends Bloc<DvdEvent, DvdState> {
  final AddDvdUseCase addDvdUseCase;

  DvdBloc({required this.addDvdUseCase}) : super(DvdInitial()) {
    on<AddDvd>(_onAddDvd);
  }

  void _onAddDvd(AddDvd event, Emitter<DvdState> emit) {
    // Get the current list of DVDs, or an empty list if it's the first one
    final currentDvds = state is DvdLoaded ? (state as DvdLoaded).dvds : [];

    // Use the use case to create a new DVD entity
    final newDvd = addDvdUseCase(screenSize: event.screenSize);

    // Emit a new state with the updated list
    emit(DvdLoaded(dvds: List.from(currentDvds)..add(newDvd)));
  }
}

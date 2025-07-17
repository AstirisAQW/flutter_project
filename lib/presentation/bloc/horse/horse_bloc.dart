import 'package:bloc/bloc.dart';
import '../../../domain/entities/horse_entity.dart';
import '../../../domain/usecases/horse/add_horse.dart';
import '../../../domain/usecases/horse/delete_horse.dart';
import 'horse_event.dart';
import 'horse_state.dart';

class HorseBloc extends Bloc<HorseEvent, HorseState> {
  final AddHorseUseCase addHorseUseCase;
  final DeleteHorseUseCase deleteHorseUseCase;

  HorseBloc({
    required this.addHorseUseCase,
    required this.deleteHorseUseCase
  })
    : super(HorseInitial()) {
    on<AddHorse>(_onAddHorse);
    on<DeleteHorse>(_onDeleteHorse);
  }

  void _onAddHorse(AddHorse event, Emitter<HorseState> emit) {
    final currentHorses = state is HorseLoaded
        ? (state as HorseLoaded).horse
        : <HorseEntity>[];
        
    final newHorse = addHorseUseCase(
      screenWidth: event.screenSize.width,
      screenHeight: event.screenSize.height,
      image: event.image,
      sound: event.sound,
    );
    emit(HorseLoaded(horse: List.from(currentHorses)..add(newHorse)));
  }

  void _onDeleteHorse(DeleteHorse event, Emitter<HorseState> emit) {
    if (state is HorseLoaded) {
      final currentHorse = (state as HorseLoaded).horse;
      final updatedList = deleteHorseUseCase(
        DeleteHorseParams(horse: currentHorse),
      );

      if (updatedList.isEmpty) {
        emit(HorseInitial());
      } else {
        emit(HorseLoaded(horse: updatedList));
      }
    }
  }
}
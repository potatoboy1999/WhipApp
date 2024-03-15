import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, MyPlayerState> {
  PlayerBloc() : super(PlayerInitial()) {
    on<LoadPlayer>((event, emit) {
      emit(PlayerLoaded(isPlaying: false));
    });
    on<StartPlayer>((event, emit) {
      emit(PlayerPlaying(isPlaying: true));
    });
    on<StopPlayer>((event, emit) {
      emit(PlayerLoaded(isPlaying: false));
    });
  }
}

part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class LoadPlayer extends PlayerEvent{
  @override
  List<Object> get props => [];
}

class StartPlayer extends PlayerEvent{
  final bool isPlaying;

  StartPlayer(this.isPlaying);

  @override
  List<Object> get props => [isPlaying];
}

class StopPlayer extends PlayerEvent{
  final bool isPlaying;

  StopPlayer(this.isPlaying);

  @override
  List<Object> get props => [isPlaying];
}
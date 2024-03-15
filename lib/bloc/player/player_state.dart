part of 'player_bloc.dart';

abstract class MyPlayerState extends Equatable {
  const MyPlayerState();

  @override
  List<Object> get props => [];
}

class PlayerInitial extends MyPlayerState {
  @override
  List<Object> get props => [];
}

class PlayerLoaded extends MyPlayerState {
  final bool isPlaying;

  const PlayerLoaded({required this.isPlaying});

  @override
  List<Object> get props => [isPlaying];
}

class PlayerPlaying extends MyPlayerState {
  final bool isPlaying;

  const PlayerPlaying({required this.isPlaying});

  @override
  List<Object> get props => [isPlaying];
}
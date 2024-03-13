part of 'whip_bloc.dart';

abstract class WhipState extends Equatable {
  const WhipState();

  @override
  List<Object> get props => [];
}

class WhipInitial extends WhipState {
  @override
  List<Object> get props => [];
}

class WhipLoaded extends WhipState {
  final Whip whip_selected;

  const WhipLoaded({required this.whip_selected});

  @override
  List<Object> get props => [whip_selected];
}


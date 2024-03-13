part of 'whip_bloc.dart';

abstract class WhipEvent extends Equatable {
  const WhipEvent();

  @override
  List<Object> get props => [];
}

class LoadWhipSelector extends WhipEvent{
  @override
  List<Object> get props => [];
}

class SelectWhip extends WhipEvent{
  final Whip whip;

  const SelectWhip(this.whip);

  @override
  List<Object> get props => [whip];
}
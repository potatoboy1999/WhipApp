import 'package:equatable/equatable.dart';

class Player extends Equatable{
  final bool isPlaying;

  const Player({
    required this.isPlaying
  });

  @override
  List<Object?> get props => [isPlaying];
}
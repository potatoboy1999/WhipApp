import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';

class Whip extends Equatable{
  final String id;
  final String name;
  final AssetSource audio_source;

  const Whip({
    required this.id,
    required this.name,
    required this.audio_source,
  });

  @override
  List<Object?> get props => [id, name, audio_source];

  static List<Whip> whips = [
    Whip(
        id: '1',
        name: 'A',
        audio_source: AssetSource('sounds/whip1.mp3'),
    ),
    Whip(
        id: '2',
        name: 'B',
        audio_source: AssetSource('sounds/whip2.mp3'),
    ),
    Whip(
        id: '3',
        name: 'C',
        audio_source: AssetSource('sounds/whip3.mp3'),
    ),
    Whip(
        id: '4',
        name: 'D',
        audio_source: AssetSource('sounds/whip4.mp3'),
    ),
    Whip(
        id: '5',
        name: 'E',
        audio_source: AssetSource('sounds/whip5.mp3'),
    ),
    Whip(
        id: '6',
        name: 'F',
        audio_source: AssetSource('sounds/whip6.mp3'),
    ),
  ];
}
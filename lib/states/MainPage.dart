import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{
  MainPage() : super();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  void whipSound() async{
    await player.setVolume(1.0);
    await player.play(
        AssetSource('sounds/whip1.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.cyan,
        title: const Text('WHIP!'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Whip!'),

            IconButton(
              onPressed: whipSound,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.cyan)
              ),
              icon: const Icon(Icons.volume_up),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

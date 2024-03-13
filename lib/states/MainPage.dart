import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whipapp/bloc/whip/whip_bloc.dart';
import 'package:whipapp/models/whip_model.dart';

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

  void playWhipSound(AssetSource source) async{
    await player.setVolume(1.0);
    await player.play(source);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: BlocBuilder<WhipBloc, WhipState>(
          builder: (context, state){
            if(state is WhipInitial){
              return const CircularProgressIndicator();
            }
            if(state is WhipLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      for(int i = 0; i < Whip.whips.length; i++)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              minimumSize: const Size(110, 110),
                              backgroundColor: (state.whip_selected == Whip.whips[i])?
                                Colors.lightBlueAccent:
                                Colors.deepPurpleAccent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)
                                )
                              )
                            ),
                            onPressed: (){
                              context.read<WhipBloc>().add(SelectWhip(Whip.whips[i]));
                            },
                            child: Text(
                              Whip.whips[i].name,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                              ),
                            )
                        ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: Colors.white60,
                      minimumSize: const Size(240, 240),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(120))
                      )
                    ),
                    onPressed: (){
                      playWhipSound(state.whip_selected.audio_source);
                    },
                    child: const Text(
                      'Whip!',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.lightBlueAccent
                      ),
                    )
                  )
                ],
              );
            }else{
              return const Text('error...');
            }
          },
        ),
      ),
    );
  }
}

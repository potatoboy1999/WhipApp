import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whipapp/bloc/player/player_bloc.dart';
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
    player.onPlayerComplete.listen((_) {
      //onComplete();
      print('Completed!');
    });
  }

  void playSpinSound() async{
    await player.stop();
    await player.setVolume(1.0);
    await player.play(AssetSource('sounds/spin_final.mp3'));
  }

  void playWhipSound(AssetSource source) async{
    await player.stop();
    await player.setVolume(1.0);
    await player.play(source);
  }



  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    var buttonSize = mediaWidth * 0.8;
    var contentHeight = mediaHeight - 160;
    if((mediaWidth * 0.8) >= contentHeight){
      buttonSize = contentHeight - 25.0;
    }
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: BlocBuilder<WhipBloc, WhipState>(
          builder: (context, state){
            if(state is WhipInitial){
              return const CircularProgressIndicator();
            }
            if(state is WhipLoaded){
              return Container(
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: contentHeight,
                      width: mediaWidth,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Listener(
                            onPointerDown: (event){
                              print('PressedDown!');
                              playSpinSound();
                              context.read<PlayerBloc>().add(StartPlayer(true));
                            },
                            onPointerUp: (event){
                              print('PressedUp!');
                              playWhipSound(state.whip_selected.audio_source);
                              context.read<PlayerBloc>().add(StopPlayer(false));
                            },
                            child: SizedBox(
                              // height: 240,
                              // width: 240,
                              height: buttonSize,
                              width: buttonSize,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(buttonSize/2),
                                  ),
                                ),
                                child: RawMaterialButton(
                                  shape: const CircleBorder(),
                                  elevation: 1.5,
                                  focusElevation: 2,
                                  fillColor: Colors.white60,
                                  highlightColor: Colors.deepPurple,
                                  onPressed: (){},
                                  child: BlocBuilder<PlayerBloc, MyPlayerState>(
                                    builder: (context, pState){
                                      if(pState is PlayerLoaded){
                                        return Text(
                                          'Hold!',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        );
                                      }else if(pState is PlayerPlaying){
                                        return Text(
                                          'Whip!',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        );
                                      }else{
                                        return Text("error...");
                                      }

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                  )
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Text(
                                    "Whips:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 25.0,
                                horizontal: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  for(int i = 0; i < Whip.whips.length; i++)
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 1,
                                          minimumSize: const Size(20, 60),
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
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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

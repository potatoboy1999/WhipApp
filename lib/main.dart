import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whipapp/bloc/player/player_bloc.dart';
import 'package:whipapp/bloc/whip/whip_bloc.dart';
import 'package:whipapp/states/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WhipBloc()..add(LoadWhipSelector())
        ),
        BlocProvider(
            create: (context) => PlayerBloc()..add(LoadPlayer())
        )
      ],
      child: MaterialApp(
        title: 'Flutter Whip',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainPage(),
      ),
    );
  }
}

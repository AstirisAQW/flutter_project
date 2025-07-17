import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_project/domain/usecases/dvd/add_dvd.dart';
import 'package:flutter_project/domain/usecases/dvd/deleteAll_dvd.dart';
import 'package:flutter_project/domain/usecases/dvd/delete_dvd.dart';
import 'package:flutter_project/presentation/bloc/dvd/dvd_bloc.dart';
import 'package:flutter_project/presentation/pages/page.dart';


import 'package:flutter_project/domain/usecases/horse/add_horse.dart';
import 'package:flutter_project/domain/usecases/horse/delete_horse.dart';
import 'package:flutter_project/presentation/bloc/horse/horse_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'BLoC Clean Arch',
    theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DvdBloc(
            addDvdUseCase: AddDvdUseCase(const Uuid()),
            deleteDvdUseCase: DeleteDvdUseCase(),
            deleteAllDvdsUseCase: DeleteAllDvdsUseCase(),
          ),
        ),
        BlocProvider(
          create: (context) => HorseBloc(
            addHorseUseCase: AddHorseUseCase(const Uuid()),
            deleteHorseUseCase: DeleteHorseUseCase(),
          ),
        ),
      ],
      child: const MainPage(),
    ),
  );
    
  }
  
}

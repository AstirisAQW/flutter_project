import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/domain/usecases/add_dvd.dart';
import 'package:flutter_project/domain/usecases/deleteAll_dvd.dart';
import 'package:flutter_project/domain/usecases/delete_dvd.dart';
import 'package:flutter_project/presentation/bloc/dvd_bloc.dart';
import 'package:flutter_project/presentation/pages/dvd_page.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DVD BLoC Clean Arch',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: BlocProvider(
        create: (context) => DvdBloc(
          addDvdUseCase: AddDvdUseCase(const Uuid()),
          deleteDvdUseCase: DeleteDvdUseCase(),
          deleteAllDvdsUseCase: DeleteAllDvdsUseCase(),
        ),
        child: const DvdPage(),
      ),
    );
  }
}

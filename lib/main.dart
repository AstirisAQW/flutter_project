import '../../domain/usecases/add_dvd.dart';
import '../../presentation/bloc/dvd_bloc.dart';
import '../../presentation/pages/dvd_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      // Use BlocProvider to create and provide the BLoC instance to the widget tree.
      home: BlocProvider(
        create: (context) => DvdBloc(
          // Here we inject the dependency (the use case) into the BLoC.
          addDvdUseCase: AddDvdUseCase(const Uuid()),
        ),
        child: const DvdPage(),
      ),
    );
  }
}

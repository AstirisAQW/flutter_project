import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dvd/dvd_bloc.dart';
import '../bloc/dvd/dvd_event.dart';
import '../bloc/dvd/dvd_state.dart';
import '../widgets/dvd_widget.dart';

import '../bloc/horse/horse_bloc.dart';
import '../bloc/horse/horse_event.dart';
import '../bloc/horse/horse_state.dart';
import '../widgets/horse_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Display DVDs
          BlocBuilder<DvdBloc, DvdState>(
            builder: (context, state) {
              if (state is DvdLoaded) {
                return Stack(
                  children: state.dvds.map((dvd) {
                    return DvdWidget(
                      key: ValueKey(dvd.id),
                      dvdEntity: dvd,
                      screenSize: screenSize,
                    );
                  }).toList(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          // Display Horses
          BlocBuilder<HorseBloc, HorseState>(
            builder: (context, state) {
              if (state is HorseLoaded) {
                return Stack(
                  children: state.horse.map((horse) {
                    return HorseWidget(
                      key: ValueKey(horse.id),
                      horseEntity: horse,
                      screenSize: screenSize,
                    );
                  }).toList(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      // Controls for both features
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildDvdControls(context, screenSize),
          const SizedBox(height: 16),
          _buildHorseControls(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildDvdControls(BuildContext context, Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<DvdBloc>().add(DeleteAllDvds()),
          tooltip: 'Delete All DVDs',
          backgroundColor: Colors.red,
          mini: true,
          heroTag: 'deleteAllDvd',
          child: const Icon(Icons.delete_forever),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () => context.read<DvdBloc>().add(DeleteDvd()),
          tooltip: 'Delete DVD',
          backgroundColor: Colors.orange,
          mini: true,
          heroTag: 'deleteDvd',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () => context.read<DvdBloc>().add(AddDvd(screenSize: screenSize)),
          tooltip: 'Add DVD',
          heroTag: 'addDvd',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildHorseControls(BuildContext context, Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<HorseBloc>().add(DeleteHorse()),
          tooltip: 'Delete Horse',
          backgroundColor: Colors.deepPurple[300],
          mini: true,
          heroTag: 'deleteHorse',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () => context.read<HorseBloc>().add(AddHorse(screenSize: screenSize)),
          tooltip: 'Add Horse',
          backgroundColor: Colors.pink,
          heroTag: 'addHorse',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
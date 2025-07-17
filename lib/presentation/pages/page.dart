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
      // Use a Row to place the button columns at the end
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildDvdControls(context, screenSize),
          const SizedBox(width: 16),
          _buildHorseControls(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildDvdControls(BuildContext context, Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () =>
              context.read<DvdBloc>().add(AddDvd(screenSize: screenSize)),
          tooltip: 'Add DVD',
          heroTag: 'addDvd',
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () => context.read<DvdBloc>().add(DeleteDvd()),
          tooltip: 'Delete DVD',
          backgroundColor: Colors.orange,
          mini: true,
          heroTag: 'deleteDvd',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () => context.read<DvdBloc>().add(DeleteAllDvds()),
          tooltip: 'Delete All DVDs',
          backgroundColor: Colors.red,
          mini: true,
          heroTag: 'deleteAllDvd',
          child: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }

  Widget _buildHorseControls(BuildContext context, Size screenSize) {
    // This is now a Column for vertical alignment
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Button for Haru Urara
        FloatingActionButton(
          onPressed: () => context.read<HorseBloc>().add(
            AddHorse(
              screenSize: screenSize,
              image: 'assets/images/haru_urara.png',
              sound: 'sounds/haru_urara_sound.wav',
            ),
          ),
          tooltip: 'Add Haru Urara',
          backgroundColor: Colors.pink,
          heroTag: 'addHorse_HaruUrara', // Unique heroTag
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),

        // Button for Meisho Mambo
        FloatingActionButton(
          onPressed: () => context.read<HorseBloc>().add(
            AddHorse(
              screenSize: screenSize,
              image: 'assets/images/meisho_mambo.png',
              sound: '/sounds/meisho_mambo_sound.wav',
            ),
          ),
          tooltip: 'Add Meisho Mambo',
          backgroundColor: Colors.blue[300],
          heroTag: 'addHorse_Meishomambo', // Unique heroTag
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),

        // Generic Delete Button
        FloatingActionButton(
          onPressed: () => context.read<HorseBloc>().add(DeleteHorse()),
          tooltip: 'Delete Last Horse',
          backgroundColor: Colors.deepPurple[300],
          mini: true,
          heroTag: 'deleteHorse',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

import '../../../presentation/bloc/dvd_bloc.dart';
import '../../../presentation/bloc/dvd_event.dart';
import '../../../presentation/bloc/dvd_state.dart';
import '../../../presentation/widgets/moving_dvd_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DvdPage extends StatelessWidget {
  const DvdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We get the screen size here to pass it to the BLoC event
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocBuilder<DvdBloc, DvdState>(
        builder: (context, state) {
          if (state is DvdLoaded) {
            // A Stack allows us to position widgets freely
            return Stack(
              children: state.dvds.map((dvd) {
                return MovingDvdWidget(
                  // Using a ValueKey helps Flutter identify which widget is which
                  key: ValueKey(dvd.id),
                  dvdEntity: dvd,
                  screenSize: screenSize,
                );
              }).toList(),
            );
          }
          // Initial state
          return const Center(
            child: Text(
              'Press the + button to add a DVD logo!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Dispatch the event to the BLoC
          context.read<DvdBloc>().add(AddDvd(screenSize: screenSize));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

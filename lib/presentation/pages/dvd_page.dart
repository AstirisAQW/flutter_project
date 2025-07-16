import '../../presentation/bloc/dvd_bloc.dart';
import '../../presentation/bloc/dvd_event.dart';
import '../../presentation/bloc/dvd_state.dart';
import '../../presentation/widgets/moving_dvd_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DvdPage extends StatelessWidget {
  const DvdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocBuilder<DvdBloc, DvdState>(
        builder: (context, state) {
          if (state is DvdLoaded) {
            return Stack(
              children: state.dvds.map((dvd) {
                return MovingDvdWidget(
                  key: ValueKey(dvd.id),
                  dvdEntity: dvd,
                  screenSize: screenSize,
                );
              }).toList(),
            );
          }
          return const Center(
            child: Text(
              'Press the + button to add a DVD logo!',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
          );
        },
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<DvdBloc>().add(DeleteAllDvds());
            },
            tooltip: 'Delete All',
            backgroundColor: Colors.red,
            mini: true,
            child: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: () {
              context.read<DvdBloc>().add(DeleteDvd());
            },
            tooltip: 'Delete Dvd',
            backgroundColor: Colors.orange,
            mini: true,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),

          FloatingActionButton(
            onPressed: () {
              context.read<DvdBloc>().add(AddDvd(screenSize: screenSize));
            },
            tooltip: 'Add DVD',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

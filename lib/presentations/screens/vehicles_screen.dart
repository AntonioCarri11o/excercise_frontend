import 'package:execrcise_frontend/data/repository/vehicle_repository.dart';
import 'package:execrcise_frontend/presentations/cubit/vehicle_cubit.dart';
import 'package:execrcise_frontend/presentations/cubit/vehicle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/views/form_view.dart';


class VehiclesView extends StatelessWidget {
  const VehiclesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excercise vehicles'),
      ),
      body: BlocProvider(
        create: (context) => VehicleCubit(
          vehicleRepository: RepositoryProvider.of<VehicleRepository>(context)
        ),
        child: const VehiclesScreen(),
      )
    );
  }
}

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final vehicleCubit = BlocProvider.of<VehicleCubit>(context);
    return Column(
      children: [
        Expanded(child: BlocBuilder<VehicleCubit, VehicleState>(
          builder: (context, state) {
            if (state is VehicleLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VehicleSuccess) {
              final vehicles = state.vehicles;
              return ListView.builder(
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicles[index];
                  return ListTile(
                    title: Text(vehicle.modelo),
                    subtitle: Text(vehicle.marca),
                    trailing: Row(
                      mainAxisSize:  MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){print('pene');},
                          icon: Icon(Icons.edit),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Center(
                            child: Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.redAccent,
                                shape: CircleBorder()
                              ),
                              child:
                              IconButton(
                                  onPressed: (){
                                    vehicleCubit.deleteVehicle(vehicle.id!);
                                  },
                                  icon: Icon(Icons.delete),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  );
                }
              );
            } else if (state is VehicleError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Press the button ti fetch vehicles'));
          },
        )),
        ElevatedButton(
          onPressed: () {
            vehicleCubit.fetchAllVehicles();
          },
          child: const Text('data'),
        ),
        FormView(),
      ],
    );
  }
}


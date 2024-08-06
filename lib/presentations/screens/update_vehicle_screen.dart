import 'package:execrcise_frontend/data/model/vehicle_model.dart';
import 'package:execrcise_frontend/data/repository/vehicle_repository.dart';
import 'package:execrcise_frontend/presentations/cubit/vehicle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateVehicleScreen extends StatelessWidget {
  const UpdateVehicleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final VehicleModel vehicle = ModalRoute.of(context)!.settings.arguments as VehicleModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle.marca} ${vehicle.modelo}'),
      ),
      body: BlocProvider(
        create: (context) => VehicleCubit(
        vehicleRepository: RepositoryProvider.of<VehicleRepository>(context)
        ),
            
            child: const Text('aaaa'),
      ),
    );
  }
}

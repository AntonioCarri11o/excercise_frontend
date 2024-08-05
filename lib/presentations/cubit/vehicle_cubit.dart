import 'package:execrcise_frontend/data/repository/vehicle_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/vehicle_model.dart';
import 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final VehicleRepository vehicleRepository;

  VehicleCubit({required this.vehicleRepository}) : super(VehicleInitial());
  Future<void> createVehicle(VehicleModel vehicle) async {
    try {
      emit(VehicleLoading());
      await vehicleRepository.createVehicle(vehicle);
      final vehicles = await vehicleRepository.getVehicles();
      emit(VehicleSuccess(vehicles: vehicles));
    } catch(e) {
      emit(VehicleError(message: e.toString()));
    }
  }

  Future<void> deleteVehicle(int id) async {
    try {
      emit(VehicleLoading());
      await vehicleRepository.deleteVehicle(id);
      final vehicles = await vehicleRepository.getVehicles();
      emit(VehicleSuccess(vehicles: vehicles));
    } catch(e) {
      emit(VehicleError(message: e.toString()));
    }
  }

  Future<void> fetchAllVehicles() async {
    try {
      emit(VehicleLoading());
      final vehicles = await vehicleRepository.getVehicles();
      emit(VehicleSuccess(vehicles: vehicles));
    } catch (e) {
      emit(VehicleError(message: e.toString()));
    }
  }
}
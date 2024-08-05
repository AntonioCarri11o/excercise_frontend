import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/vehicle_model.dart';

class VehicleRepository {
  final String apiUrl;
  VehicleRepository({required this.apiUrl});

  Future<void> createVehicle(VehicleModel vehicle) async {
    final response = await http.post(
      Uri.parse('${apiUrl}create_vehicle'),
      body: jsonEncode(vehicle.toJson()..remove('id')),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create vehicle');
    }
  }

  Future<void> deleteVehicle(int id) async {
    final response = await http.delete(
      Uri.parse('${apiUrl}delete_car?id=$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete vehicle');
    }
  }
  Future<List<VehicleModel>> getVehicles() async {
    final response = await http.get(
      Uri.parse('${apiUrl}vehicles'),
    );
    if(response.statusCode == 200) {
      final decoded  = json.decode(response.body);
      Iterable l = decoded['data'];
      return List<VehicleModel>.from(l.map((model) => VehicleModel.fromJson(model)));
    } else {
      throw Exception('Failed to load vehicles');
    }
  }
}
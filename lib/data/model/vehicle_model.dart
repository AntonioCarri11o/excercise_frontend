class VehicleModel {
  final int? id;
  final String marca;
  final String modelo;
  final double autonomia;
  final int camara;

  VehicleModel({
    this.id,
    required this.marca,
    required this.modelo,
    required this.autonomia,
    required this.camara
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      marca: json['marca'],
      modelo: json['modelo'],
      autonomia: json['autonomia'],
      camara: json['camara']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'autonomia': autonomia,
      'camara': camara
    };
  }
}

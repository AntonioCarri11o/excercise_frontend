import 'package:execrcise_frontend/data/model/vehicle_model.dart';
import 'package:execrcise_frontend/presentations/cubit/vehicle_cubit.dart';
import 'package:execrcise_frontend/presentations/cubit/vehicle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  bool? _has_camera;
  String? _marca;
  String? _modelo;
  double? _autonomia;
  @override
  Widget build(BuildContext context) {
    final vehicleCubit = BlocProvider.of<VehicleCubit>(context);
    return Expanded(child: BlocBuilder<VehicleCubit, VehicleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(48.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Marca'
                  ),
                  onChanged: (v) {
                    setState(() {
                      _marca = v;
                    });
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Modelo'
                    ),
                    onChanged: (v) {
                      setState(() {
                        _modelo = v;
                      });
                    }
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Autonomía en KM'
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (v) {
                      setState(() {
                        _autonomia = double.parse(v);
                      });
                    }
                ),
                DropdownButtonFormField<bool>(
                    onChanged:(v){
                      setState(() {
                        _has_camera = v;
                      });
                    },
                    value: _has_camera,
                    decoration: InputDecoration(
                        labelText: '¿Tiene cámara?'
                    ),
                    items:[
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text('Verdadero'),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text('Falso'),
                      )
                    ]
                ),
                Padding(padding: EdgeInsets.all(16.0), child: FilledButton(onPressed: (){
                  vehicleCubit.createVehicle(VehicleModel(marca: _marca!, modelo: _modelo!, autonomia: _autonomia!, camara: _has_camera! ? 1 : 0));
                }, child: Text('Enviar')))
              ],
            ),
          ),
        );
      },
    ));
  }
}

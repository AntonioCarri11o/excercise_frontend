import 'package:execrcise_frontend/data/repository/vehicle_repository.dart';
import 'package:execrcise_frontend/presentations/screens/vehicles_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => VehicleRepository(
              apiUrl: "https://j33keob0a8.execute-api.us-east-1.amazonaws.com/Prod/"
            ),
          )
        ],
        child: MaterialApp(
          title: 'alamare',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const VehiclesView()
        )
    );
  }
}

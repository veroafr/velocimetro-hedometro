import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/location/viewmodels/location_viewmodel.dart';
import 'modules/location/views/location_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocationViewmodel(),
      child: MaterialApp(
        title: 'Localização com Modo Hud',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const LocationView(),
      ),
    );
  }
}

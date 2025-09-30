import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/location_viewmodel.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LocationViewmodel>();
    final isHud = vm.isHud;

    return Scaffold(
  backgroundColor: isHud ? Colors.black : null,
 appBar: isHud ? null : AppBar(
  title: const Text('Velocímetro & Hodômetro'),
  backgroundColor: Colors.green,
),

  body: Center(
    child: Transform(
      alignment: Alignment.center,
      transform: isHud ? Matrix4.rotationY(3.1416) : Matrix4.identity(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${vm.currentSpeed.toStringAsFixed(1)} km/h',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: isHud ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Distância: ${vm.totalDistance.toStringAsFixed(2)} km',
            style: TextStyle(
              fontSize: 24,
              color: isHud ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => vm.reset(),
            child: const Text('Resetar'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => vm.toggleHud(),
            child: Text(isHud ? 'Desativar HUD' : 'Ativar HUD'),
          ),
        ],
      ),
    ),
  ),
  bottomNavigationBar: isHud
      ? null
      : const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Objetivo: Calcular velocidade e distância com geolocalização',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 4),
              Text(
                'Rafael Amorim (rafaelamorim@ifsul.edu.br)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
);

  }
}

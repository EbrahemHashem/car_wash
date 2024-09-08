import 'package:car_wash/feature/wash_service/presentation/views/services/map_screen.dart';
import 'package:flutter/material.dart';

class CarWash extends StatelessWidget {
  const CarWash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

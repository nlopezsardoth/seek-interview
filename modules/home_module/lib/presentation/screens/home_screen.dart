import 'package:flutter/material.dart';
import 'package:router_module/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: Text("Home screen"),);
  }
}
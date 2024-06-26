import 'package:flutter/material.dart';
import 'package:mycloudpa/screens/menu_list_screen.dart';
import 'package:mycloudpa/service_locator.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'My Cloud PA', home: MenuListScreen());
  }
}

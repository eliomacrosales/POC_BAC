import 'package:flutter/material.dart';
import 'package:bac_poc_bloc/src/core/navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'POC',
      debugShowCheckedModeBanner: false,
      routerConfig: router
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prueba_tecnica_postulacion/api/post-repository.dart';
import 'package:prueba_tecnica_postulacion/routes/app_routes.dart';
import 'package:prueba_tecnica_postulacion/screens/home.dart';
import 'package:prueba_tecnica_postulacion/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final repo = PostRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
          appBar: AppBar(
            title: Text('JsonPlaceholder'),
          ),
          body: HomeScreen()),
    );
  }
}

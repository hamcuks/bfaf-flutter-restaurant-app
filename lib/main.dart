import 'package:dicoding_submission_restaurant_app/controller/restaurant_controller.dart';
import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:dicoding_submission_restaurant_app/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicoding Submission: Restauran',
      home: HomePage(),
    );
  }
}

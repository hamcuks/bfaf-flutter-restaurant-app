import 'package:dicoding_submission_restaurant_app/controller/restaurant_controller.dart';
import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/routes.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:dicoding_submission_restaurant_app/ui/detail_restaurant_page.dart';
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
      initialRoute: MyRoutePage.home,
      routes: {
        MyRoutePage.home: (context) => HomePage(),
        MyRoutePage.detailPage: (context) => DetailRestaurantPage(
              data:
                  ModalRoute.of(context)?.settings.arguments as RestaurantModel,
            ),
      },
    );
  }
}

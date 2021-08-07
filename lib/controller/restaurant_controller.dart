import 'dart:convert';

import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:flutter/services.dart';

class RestaurantController {
  static Future getAllRestaurants() async {
    final String jsonData =
        await rootBundle.loadString('assets/json/data_restaurant.json');
    final data = await json.decode(jsonData);

    List<RestaurantModel> listResto = [];

    for (var resto in data['restaurants']) {
      RestaurantModel data = RestaurantModel(
        id: resto['id'],
        name: resto['name'],
        description: resto['description'],
        pictureId: resto['pictureId'],
        city: resto['city'],
        rating: resto['rating'],
        menus: resto['menus'],
      );

      listResto.add(data);
    }

    return listResto;
  }
}

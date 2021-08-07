import 'package:dicoding_submission_restaurant_app/controller/restaurant_controller.dart';
import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicoding Submission: Restauran',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RestaurantModel> restaurants = [];

  @override
  void initState() {
    getAllRestaurantData();
    super.initState();
  }

  void getAllRestaurantData() {
    RestaurantController.getAllRestaurants().then((value) {
      setState(() {
        restaurants = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(restaurants);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restoku',
                style: MyTheme.appTitle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Cari makan yuk di restoran dekat kamu!',
                style: MyTheme.regularText.copyWith(color: MyTheme.black),
              ),
              SizedBox(
                height: 48,
              ),
              Flexible(
                  child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) => _buildRestaurantCard(
                  data: restaurants[index],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class _buildRestaurantCard extends StatelessWidget {
  const _buildRestaurantCard({Key? key, required this.data}) : super(key: key);

  final RestaurantModel data;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: data.id,
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black54,
            image: DecorationImage(
              image: NetworkImage(data.pictureId),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black54,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.name}',
                  style: MyTheme.cardTitle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '${data.rating}',
                            style: MyTheme.regularText,
                          )
                        ],
                      ),
                    ),
                    VerticalDivider(),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.redAccent,
                          ),
                          Text(
                            '${data.city}',
                            style: MyTheme.regularText,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

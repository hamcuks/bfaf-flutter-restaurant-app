import 'package:dicoding_submission_restaurant_app/controller/restaurant_controller.dart';
import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/routes.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RestaurantModel> restaurants = [];
  final TextEditingController _searchController = TextEditingController();

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

  void searchRestaurant(String restaurantName) {
    if (restaurantName.isEmpty) {
      getAllRestaurantData();
    } else {
      RestaurantController.searchRestaurant(restaurantName).then((value) {
        setState(() {
          restaurants = value;
        });
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                height: 24,
              ),
              TextField(
                controller: _searchController,
                onChanged: (value) => searchRestaurant(value),
                maxLines: 1,
                style: TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color(0xff6B779A), fontSize: 14),
                    suffixIcon: Icon(Icons.search, color: Color(0xff6B779A)),
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search For Doctor"),
              ),
              SizedBox(
                height: 24,
              ),
              Flexible(
                  child: ListView.builder(
                itemCount: restaurants.length == 0 ? 1 : restaurants.length,
                itemBuilder: (context, index) {
                  if (restaurants.length != 0) {
                    return _buildRestaurantCard(
                      data: restaurants[index],
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Data Tidak Ditemukan',
                        style:
                            MyTheme.regularText.copyWith(color: MyTheme.black),
                      ),
                    );
                  }
                },
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
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, MyRoutePage.detailPage, arguments: data),
      child: Hero(
        tag: data.id,
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
          child: Material(
            color: Colors.transparent,
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
      ),
    );
  }
}

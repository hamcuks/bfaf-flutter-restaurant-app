import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/routes.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key, required this.data}) : super(key: key);

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

import 'package:dicoding_submission_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:dicoding_submission_restaurant_app/widget/menu_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRestaurantPage extends StatelessWidget {
  const DetailRestaurantPage({Key? key, required this.data}) : super(key: key);

  final RestaurantModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
                      icon: Icon(CupertinoIcons.chevron_back),
                    ),
                    Text(
                      '${data.name}',
                      style: MyTheme.cardTitle.copyWith(color: MyTheme.black),
                    )
                  ],
                ),
                Hero(
                  tag: data.id,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 22),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black54,
                      image: DecorationImage(
                        image: NetworkImage('${data.pictureId}'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: MyTheme.cardTitle.copyWith(color: MyTheme.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${data.description}',
                      textAlign: TextAlign.justify,
                      style: MyTheme.regularText
                          .copyWith(color: MyTheme.black, height: 1.6),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                _BuildMenus(
                  menus: data.menus,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildMenus extends StatelessWidget {
  const _BuildMenus({
    Key? key,
    this.menus,
  }) : super(key: key);

  final menus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Menus',
          style: MyTheme.cardTitle.copyWith(color: MyTheme.black),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Foods',
          style: MyTheme.regularText.copyWith(color: MyTheme.black),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menus['foods']
              .map<Widget>((e) => MenuItem(
                    icon: Icons.lunch_dining_outlined,
                    name: e['name'],
                  ))
              .toList(),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Drinks',
          style: MyTheme.regularText.copyWith(color: MyTheme.black),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menus['drinks']
              .map<Widget>((e) => MenuItem(
                    icon: Icons.local_cafe_outlined,
                    name: e['name'],
                  ))
              .toList(),
        ),
      ],
    );
  }
}

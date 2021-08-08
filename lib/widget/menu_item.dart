import 'package:dicoding_submission_restaurant_app/theme.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: MyTheme.black,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            '$name',
            style: MyTheme.regularText.copyWith(color: MyTheme.black),
          ),
        ],
      ),
    );
  }
}

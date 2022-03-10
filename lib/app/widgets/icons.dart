import 'package:flutter/cupertino.dart';
import 'package:tasks_app/app/core/values/colors.dart';
import 'package:tasks_app/app/core/values/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(personIcon, fontFamily: 'MaterialIcons'),
      color: blue,
    ),
    Icon(
      IconData(workIcon, fontFamily: 'MaterialIcons'),
      color: lightBlue,
    ),
    Icon(
      IconData(movieIcon, fontFamily: 'MaterialIcons'),
      color: yellow,
    ),
    Icon(
      IconData(sportIcon, fontFamily: 'MaterialIcons'),
      color: green,
    ),
    Icon(
      IconData(travelIcon, fontFamily: 'MaterialIcons'),
      color: pink,
    ),
    Icon(
      IconData(shopIcon, fontFamily: 'MaterialIcons'),
      color: deepPink,
    ),
  ];
}

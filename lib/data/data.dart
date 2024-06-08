// ! 3rd Commit


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionsData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '-Rs.150',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'color': Colors.purple[700],
    'name': 'Shopping',
    'totalAmount': '-Rs.1000',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'color': Colors.green[700],
    'name': 'Health',
    'totalAmount': '-Rs.1150',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    'color': Colors.blue[700],
    'name': 'Travel',
    'totalAmount': '-Rs.2000',
    'date': 'Today',
  },
];

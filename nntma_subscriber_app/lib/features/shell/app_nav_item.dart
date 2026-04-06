import 'package:flutter/material.dart';

class AppNavItem {
  final String route;
  final String title;
  final String shortTitle;
  final IconData icon;
  final Widget page;
  const AppNavItem({
    required this.route,
    required this.title,
    required this.shortTitle,
    required this.icon,
    required this.page,
  });
}

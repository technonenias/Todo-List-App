import "package:flutter/material.dart";
import 'package:todo_list_app/home_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: HomeScreen()),
  ));
}

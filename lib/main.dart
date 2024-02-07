import 'package:ebook_app/screens/bottom_navbar.dart';
import 'package:ebook_app/screens/home/home_page.dart';
import 'package:ebook_app/screens/home/pages/book_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-book App',
      routes: {
        BottomNavbar.nameRoute: (context) => BottomNavbar(),
        HomePage.nameRoute: (context) => HomePage(),
        BookDetail.nameRoute: (context) => BookDetail(),
      },
    );
  }
}
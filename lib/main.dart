import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/pages/login_page.dart';

import './routes/page_route.dart';
import './pages/home_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home:HomePage(),
      getPages: AppPage.pages,
    );
  }
}
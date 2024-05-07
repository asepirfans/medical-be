import 'package:get/get.dart';
import 'package:medical_app/pages/register_page.dart';
import '../pages/blood_pressure_page.dart';
import '../pages/body_temp_page.dart';
import '../pages/heart_rate_page.dart';
import '../pages/satur_oxygen_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import 'route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.registerPage,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteName.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.bodyTemperature,
      page: () => BodyTemperature(),
    ),
    GetPage(
      name: RouteName.heartRate,
      page: () => HeartRate(),
    ),
    GetPage(
      name: RouteName.bloodPressure,
      page: () => BloodPressure(),
    ),
    GetPage(
      name: RouteName.saturationOxygen,
      page: () => SaturationOxygen(),
    ),
  ];
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_user/middleware/auth.dart';
import 'package:ecommerce_user/view/Fill_Photo.dart';
import 'package:ecommerce_user/view/Privacy.dart';
import 'package:ecommerce_user/view/Region.dart';
import 'package:ecommerce_user/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'model/Users.dart';
import 'view/profile.dart';
import 'view/signUp.dart';

final List<String> imgList = [
  'images/splash_screen1.png',
  'images/splash_screen2.png',
  'images/splash_screen3.png'
];
GetStorage getStorage = GetStorage();
void main() async {
  User user = Get.put(User(), permanent: true);
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
  } catch (error) {
    print("Error is ${error}");
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: "/", middlewares: [Auth()], page: () => const Signup()),
        GetPage(
          name: "/view/login",
          page: () => const Login(),
        ),
        GetPage(
          name: "/view/fillPhoto",
          page: () => const FillPhoto(),
        ),
        GetPage(
          name: "/view/privacy",
          page: () => const Privacy(),
        ),
        GetPage(name: "/view/location", page: () => const Region()),
        GetPage(name: "/view/profile", page: () => const Profile())
      ],
    );
  }
}

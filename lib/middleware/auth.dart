import 'dart:convert';

import 'package:ecommerce_user/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Auth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var data = getStorage.read("User");
    dynamic jsonData = jsonDecode(data);
    if (jsonData != null) {
      print("=========PROFILE=========");
      return RouteSettings(name: "/view/profile");
    } else {
      print("=========LOGIN=========");
      return RouteSettings(name: "/view/login");
    }
  }
}

import 'package:ecommerce_user/main.dart';
import 'package:ecommerce_user/model/Users.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void login(String email, String password) {
    User user = getStorage.read("User");
    if (email == user.phoneOrEmail && password == user.password) {
      // save Token ;
      Get.offAll("/view/home");
    } else {
      Get.snackbar("login", "Error in data");
    }
  }
}

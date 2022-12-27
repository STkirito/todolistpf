import 'package:awesonestyle/awesonestyle.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginAuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxString logins = 'verificando'.obs;
  checkDataLogin() async {
    return await Future.delayed(const Duration(milliseconds: 2000), () {
      return true;
    });
  }

  navigationToHome() => Get.offNamed('/home');
  errorLogin() {
    email.clear();
    password.clear();
    if (kDebugMode) {
      print('login error');
    }
  }
}

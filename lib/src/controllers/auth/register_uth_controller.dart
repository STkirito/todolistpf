import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterAuthController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool contract = false.obs;
  RxString logins = 'verificando'.obs;
  Future<bool> register() async {
    createUser();
    return await checkDataRegisterToLogin();
  }

  createUser() async {
    return await Future.delayed(const Duration(milliseconds: 1000), () {
      return true;
    });
  }

  checkDataRegisterToLogin() async {
    return await Future.delayed(const Duration(milliseconds: 2000), () {
      return true;
    });
  }

  navigationToHome() => Get.offNamed('/home');
  errorRegister() {
    name.clear();
    email.clear();
    password.clear();
    contract.value = false;
    if (kDebugMode) {
      print('login error');
    }
  }
}

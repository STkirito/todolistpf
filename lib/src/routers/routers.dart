import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/widgets.dart';
import 'package:todolistpf/src/interface/auth/login_auth_interface.dart';
import 'package:todolistpf/src/interface/auth/register_auth_interface.dart';
import 'package:todolistpf/src/interface/home/home_interface.dart';

List<GetPage<Widget>>? routers = [
  GetPage<Widget>(name: '/auth/login', page: () => const LoginInterface()),
  GetPage<Widget>(name: '/auth/register', page: () => RegisterInterface()),
  GetPage<Widget>(name: '/home', page: () => const HomeInterface()),
];

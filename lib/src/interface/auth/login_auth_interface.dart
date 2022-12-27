import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistpf/src/controllers/auth/login_auth_controller.dart';
import 'package:todolistpf/src/interface/shared/background_auth.dart';

class LoginInterface extends StatefulWidget {
  const LoginInterface({super.key});

  @override
  State<LoginInterface> createState() => _LoginInterfaceState();
}

class _LoginInterfaceState extends State<LoginInterface> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'loginform');
  @override
  void initState() {
    Get.put(LoginAuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AwsScreenSize(context);
    return Scaffold(
      backgroundColor: Colors.brown,
      body: BackgroundAuth(
        SizedBox(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _Title(),
                _Form(
                  formKey: _formKey,
                ),
                const _ButtonToHome(),
                const _ButtonToRecover(),
                const _ButtonToRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends GetView {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AwsScreenSize.height(20),
      child: Center(
          child: Text(
        'TodoList',
        style: GoogleFonts.dancingScript(
            fontWeight: FontWeight.w700, color: Colors.white, fontSize: 40),
      )),
    );
  }
}

class _Form extends GetView<LoginAuthController> {
  final Key? _formKey;
  const _Form({required Key formKey}) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) {
                if (!GetUtils.isEmail(value?.replaceAll(" ", "") ?? '')) {
                  return 'Email no válido';
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: AwsStyle.authInputDecoration(
                hint: 'Ingrese su correo',
                label: 'Email',
                icon: Icons.email_outlined,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: controller.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese su contraseña';
                }

                if (value.length < 6) {
                  return 'La contraseña debe de ser de 6 caracteres';
                }

                return null;
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: AwsStyle.authInputDecoration(
                hint: '**********',
                label: 'Contraseña',
                icon: Icons.lock_outline_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonToHome extends GetView<LoginAuthController> {
  const _ButtonToHome();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: AwsAnimationButton(
        angle: 0.2,
        sizeY: 45,
        actions: () async => await controller.checkDataLogin(),
        ok: () => controller.navigationToHome(),
        error: () => controller.errorLogin(),
      ),
    );
  }
}

class _ButtonToRecover extends GetView {
  const _ButtonToRecover();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AwsScreenSize.height(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Olvidaste tu contraseña',
            style: TextStyle(color: Colors.white),
          ),
          CupertinoButton(
              onPressed: () {},
              child: const Text(
                'Recuperala Aqui',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
        ],
      ),
    );
  }
}

class _ButtonToRegister extends GetView {
  const _ButtonToRegister();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AwsScreenSize.height(10),
      alignment: Alignment.bottomCenter,
      child: AwsTextRowButton(
        title: 'Aun no tienes cuenta',
        label: 'crea una',
        styleLabel: const TextStyle(color: Colors.green),
        onPressed: () {
          Get.toNamed('/auth/register');
        },
      ),
    );
  }
}

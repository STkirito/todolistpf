import 'package:flutter/material.dart';
import 'package:awesonestyle/awesonestyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistpf/src/controllers/auth/register_uth_controller.dart';
import 'package:todolistpf/src/interface/shared/background_auth.dart';

class RegisterInterface extends StatefulWidget {
  RegisterInterface({super.key});

  @override
  State<RegisterInterface> createState() => _RegisterInterfaceState();
}

class _RegisterInterfaceState extends State<RegisterInterface> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: 'loginform');

  @override
  void initState() {
    Get.put(RegisterAuthController());
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
                const _ButtonToLogin(),
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
        child: Text('TodoList',
            style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 40)),
      ),
    );
  }
}

class _Form extends GetView<RegisterAuthController> {
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
              controller: controller.name,
              //autofocus: true,
              validator: (value) {
                if (value != null) {
                  return 'Ingrese un nombre';
                }
                return null;
              },
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: AwsStyle.authInputDecoration(
                hint: 'Ingrese su nombre',
                label: 'Nombre',
                icon: Icons.people_rounded,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.email,
              //autofocus: true,
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
              //autofocus: true,
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
            _ContractButton(),
          ],
        ),
      ),
    );
  }
}

class _ContractButton extends GetView<RegisterAuthController> {
  _ContractButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AwsTcButton(
        value: controller.contract.value,
        text: Text('Terminos y condiciones'.tr),
        onPressed: () => controller.contract.value = !controller.contract.value,
      ),
    );
  }
}

class _ButtonToHome extends GetView<RegisterAuthController> {
  const _ButtonToHome();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: AwsAnimationButton(
        initLabel: const Text('Register'),
        initIcon: const Icon(Icons.create_rounded),
        actionsLabel: const Text('Creando Cuenta'),
        okLabel: const Text('Cuenta Creada'),
        angle: 0.2,
        sizeY: 50,
        actions: () async => await controller.register(),
        ok: () => controller.navigationToHome(),
        error: () => controller.errorRegister(),
      ),
    );
  }
}

class _ButtonToLogin extends GetView {
  const _ButtonToLogin();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AwsScreenSize.height(11),
      alignment: Alignment.bottomCenter,
      child: AwsTextRowButton(
        title: 'Tienes una cuenta',
        label: 'inicia ya',
        styleLabel: const TextStyle(color: Colors.green),
        onPressed: () => Get.back(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/modules/admin/pages/admin_page.dart';
import 'package:prueba_telconet/modules/auth/register/pages/register_page.dart';
import 'package:prueba_telconet/shared/helpers/global_helpers.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/services/auth_service.dart';
import 'package:prueba_telconet/shared/widget/filled_button.dart';
import 'package:prueba_telconet/shared/widget/placeholder.dart';
import 'package:prueba_telconet/shared/widget/text_button.dart';
import 'package:prueba_telconet/shared/widget/text_form_field_widget.dart';
import '../../../../env/theme/app_theme.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key, this.keyDismiss});

  final GlobalKey<State<StatefulWidget>>? keyDismiss;

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  // bool? _rememberUser;
  // late FunctionalProvider fp;
  // final _loginService = LoginService();
  // CredentialResponse? userModel;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fp = Provider.of<FunctionalProvider>(context, listen: false);
    FirebaseAuthentication authMethods = FirebaseAuthentication();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: size.width * 0.025),
              child: placeHolderWidget(placeholder: 'Usuario')),
          SizedBox(height: size.height * 0.006),
          TextFormFieldWidget(
            keyboardType: TextInputType.emailAddress,
            controller: userController,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El correo es requerido.';
              }
              if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                  .hasMatch(value)) {
                return 'El correo ingresado no es valido.';
              }
              return null;
            },
          ),
          SizedBox(height: size.height * 0.025),
          Padding(
              padding: EdgeInsets.only(left: size.width * 0.025),
              child: placeHolderWidget(placeholder: 'Contraseña')),
          SizedBox(height: size.height * 0.0056),
          TextFormFieldWidget(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            obscureText: !showPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La contraseña es requerida';
              }
              return null;
            },
            suffixIcon: IconButton(
              color: AppTheme.bordergrey,
              icon: !showPassword
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : const Icon(Icons.visibility_off_outlined),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: FilledButtonWidget(
                color: AppTheme.secundaryColor,
                textButtonColor: AppTheme.white,
                text: 'Iniciar sesión',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authMethods.signInWithEmailAndPassword(
                        userController.text, passwordController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        GlobalHelper.navigationFadeIn(
                            context, const AdminPanelPage()),
                        (route) => false);
                  }
                },
              )),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿No tienes una cuenta?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              TextButtonWidget(
                nameButton: 'Regístrate aquí',
                color: AppTheme.secundaryColor,
                onPressed: () {
                  final keyRegister = GlobalHelper.genKey();
                  fp.addPage(
                    key: keyRegister,
                    content: RegisterPage(
                      keyPage: keyRegister,
                      key: keyRegister,
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

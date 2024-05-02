import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/services/auth_service.dart';
import 'package:prueba_telconet/shared/services/db_service.dart';
import 'package:prueba_telconet/shared/widget/filled_button.dart';
import 'package:prueba_telconet/shared/widget/placeholder.dart';
import 'package:prueba_telconet/shared/widget/text_button.dart';
import 'package:prueba_telconet/shared/widget/text_form_field_widget.dart';
import '../../../../env/theme/app_theme.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key, this.keyDismiss});
  final GlobalKey<State<StatefulWidget>>? keyDismiss;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController userController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  bool showPassword = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  void dispose() {
    userController;
    nameController;
    lastnameController;
    passwordController;
    passwordRepeatController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        FirebaseAuthentication authMethods = FirebaseAuthentication();
    FirebaseDatabaseServices databaseServices = FirebaseDatabaseServices();

    final size = MediaQuery.of(context).size;
  final fp = Provider.of<FunctionalProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.12, bottom: size.height * 0.01),
            child: placeHolderWidget(placeholder: 'Nombres')),
        TextFormFieldWidget(
          maxWidth: 300,
          keyboardType: TextInputType.text,
          controller: nameController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El nombre es requerido.';
            }
            return null;
          },
        ),
        SizedBox(height: size.height * 0.025),
        Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.12, bottom: size.height * 0.01),
            child: placeHolderWidget(placeholder: 'Apellidos')),
        TextFormFieldWidget(
          maxWidth: 300,
          keyboardType: TextInputType.text,
          controller: lastnameController,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El apellido es requerido.';
            }
            return null;
          },
        ),
        SizedBox(height: size.height * 0.025),
        Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.12, bottom: size.height * 0.01),
            child: placeHolderWidget(placeholder: 'Correo')),
        TextFormFieldWidget(
          maxWidth: 300,
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
            padding: EdgeInsets.only(left: size.width * 0.12),
            child: placeHolderWidget(placeholder: 'Contraseña')),
        SizedBox(height: size.height * 0.0056),
        TextFormFieldWidget(
            maxWidth: 300,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo Requerido';
              } 
              return null;
            },
            obscureText: !showPassword,
            suffixIcon: IconButton(
                color: AppTheme.bordergrey,
                icon: !showPassword
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                })),
        SizedBox(height: size.height * 0.025),
        Padding(
            padding: EdgeInsets.only(left: size.width * 0.12),
            child: placeHolderWidget(placeholder: 'Repita contraseña')),
        SizedBox(height: size.height * 0.0056),
        TextFormFieldWidget(
            maxWidth: 300,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.send,
            controller: passwordRepeatController,
            validator: (value) {
              if (value!.isNotEmpty ) {
                if (value != passwordController.text) {
                  return 'ingrese la misma contraseña';
                }
              } else {
                return 'Campo Requerido';
              }
              return null;
            },
            obscureText: !showPassword,
            suffixIcon: IconButton(
                color: AppTheme.bordergrey,
                icon: !showPassword
                    ? const Icon(Icons.remove_red_eye_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                })),
        SizedBox(height: size.height * 0.04),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: FilledButtonWidget(
              color: AppTheme.secundaryColor,
              textButtonColor: AppTheme.white,
              text: 'Registrar',
              onPressed: () async{
                if(  await authMethods.registerWithEmailAndPassword(userController.text, passwordController.text)){
                  databaseServices.createUser(name: nameController.text , lastName: lastnameController.text, email: userController.text);

                  fp.dismissAlert(key: widget.keyDismiss!);
                }

                  

                
                

              },
            )),
        SizedBox(height: size.height * 0.01),
        TextButtonWidget(
          color: AppTheme.secundaryColor,
          fontWeight: FontWeight.bold,
          nameButton: 'Cancelar',
          onPressed: () {
             setState(() {
      
    });
            final fp = Provider.of<FunctionalProvider>(context, listen: false);
            fp.dismissAlert(key: widget.keyDismiss!);
          },
        )
      ],
    );
  }
}

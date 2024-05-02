import 'package:flutter/material.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/auth/login/widget/form_login.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';


class LoginPage extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>>? keyPage;

  const LoginPage({Key? key, this.keyPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const LayoutWidget(
    
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 180),
        child: SingleChildScrollView(
          
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Iniciar Sesion', style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.w700,
                  color: AppTheme.secundaryColor,
                ),),
                SizedBox(height: 20,),
                FormLoginWidget(),
              ],
            ),
          )
          ),
        ),
      );
    
  }
}

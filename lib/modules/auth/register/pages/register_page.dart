import 'package:flutter/material.dart';
import 'package:prueba_telconet/modules/auth/register/widget/register_form.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';
import '../../../../env/theme/app_theme.dart';

class RegisterPage extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>>? keyPage;

  const RegisterPage({Key? key, this.keyPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutWidget(
      nameInterceptor: 'register',
      keyDismiss: widget.keyPage,
      requiredStack: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registrate', style: TextStyle(
                  fontSize: 40, 
                  fontWeight: FontWeight.w700,
                  color: AppTheme.secundaryColor,
                ),),
            SizedBox(height: 20),
            RegisterWidget(keyDismiss: widget.keyPage),
            
          ],
        ),
      ),
    );
  }
}

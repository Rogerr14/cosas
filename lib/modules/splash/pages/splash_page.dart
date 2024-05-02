import 'package:flutter/material.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/auth/login/pages/login_page.dart';
import 'package:prueba_telconet/shared/helpers/global_helpers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    debugPrint('splash');
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            GlobalHelper.navigationFadeIn(context, const LoginPage()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(color: AppTheme.primaryColor),
        child: Center(
          child: Text('Splash Screen', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: AppTheme.secundaryColor),),
        ),
      ),
    );
  }
}

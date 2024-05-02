import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/admin/submodules/acces_registry/pages/acces_registry_page.dart';
import 'package:prueba_telconet/modules/admin/submodules/admin_user/pages/admin_user_page.dart';
import 'package:prueba_telconet/modules/admin/submodules/permission/pages/permission_registry_page.dart';
import 'package:prueba_telconet/modules/admin/widget/card_widget.dart';
import 'package:prueba_telconet/modules/auth/login/pages/login_page.dart';
import 'package:prueba_telconet/shared/helpers/global_helpers.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fp = Provider.of<FunctionalProvider>(context, listen: false);
    return LayoutWidget(
      requiredStack: false,
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          backgroundColor: AppTheme.secundaryColor,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Mis Accesos',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.list_alt_rounded,
                size: 30,
                color: AppTheme.primaryColor,
              )
            ],
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              
              TextButton(
                  onPressed: () async {
                    // final loginKey =  GlobalHelper.genKey();
                    

                    Navigator.pushAndRemoveUntil(
                        context,
                        GlobalHelper.navigationFadeIn(
                            context, const LoginPage()),
                        (route) => false);
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    'Cerrar Sesion',
                    style:
                        TextStyle(color: AppTheme.secundaryColor, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

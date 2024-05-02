import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/admin/submodules/admin_user/pages/admin_user_page.dart';
import 'package:prueba_telconet/modules/admin/widget/card_widget.dart';
import 'package:prueba_telconet/modules/auth/login/pages/login_page.dart';
import 'package:prueba_telconet/shared/helpers/global_helpers.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fp = Provider.of<FunctionalProvider>(context, listen: false);
    return LayoutWidget(
      
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Admin Panel',
                style: TextStyle(
                  color: AppTheme.secundaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                icon: Icons.person,
                title: 'Administar Usuarios',
                onPress: () {
                  final adminUserKey = GlobalHelper.genKey();
                  fp.addPage(
                    key: adminUserKey,
                    content: AdminUserPage(
                      key: adminUserKey,
                      keyPage: adminUserKey,
                      title:'Administar Usuarios', icon: Icons.person,
                      
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                icon: Icons.security,
                title: 'Gestionar Permisos',
                onPress: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                icon: Icons.text_snippet,
                title: 'Registros de Acceso',
                onPress: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        GlobalHelper.navigationFadeIn(
                            context, const LoginPage()),
                        (route) => false);
                        await FirebaseAuth.instance.signOut();
                  },
                  child: Text(
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

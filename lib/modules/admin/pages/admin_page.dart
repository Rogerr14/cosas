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
      // requiredStack: false,
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
                    // fp.clearAllAlert();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                icon: Icons.security,
                title: 'Gestionar Permisos',
                onPress: () {
                  final permissionKey = GlobalHelper.genKey();
                  
                  fp.addPage(
                    key: permissionKey,
                    content: PermissionRegistryPage(
                      key: permissionKey,
                      keyPage: permissionKey,
                      title:'Gestionar Permisos', icon: Icons.security,
                      
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CardWidget(
                icon: Icons.text_snippet,
                title: 'Registros de Acceso',
                onPress: () {
                  final registryAccessKey = GlobalHelper.genKey();
                  
                  fp.addPage(
                    key: registryAccessKey,
                    content: AccessRegistryPage(
                      key: registryAccessKey,
                      keyPage: registryAccessKey,
                      title:'Registro de Accesos', icon: Icons.text_snippet,
                      
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
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

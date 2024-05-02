import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/admin/submodules/admin_user/widget/user_card_widget.dart';
import 'package:prueba_telconet/modules/registry_user/page/add_new_user_page.dart';
import 'package:prueba_telconet/shared/helpers/global_helpers.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/services/db_service.dart';
import 'package:prueba_telconet/shared/widget/filled_button.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';

class AdminUserPage extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>>? keyPage;
  final String title;
  final IconData icon;
  const AdminUserPage(
      {super.key, this.keyPage, required this.title, required this.icon});

  @override
  State<AdminUserPage> createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  FirebaseDatabaseServices databaseServices = FirebaseDatabaseServices();

  @override
  void initState() {
    
    // TODO: implement initState

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final fp = Provider.of<FunctionalProvider>(context,listen: false);
    return LayoutWidget(
      nameInterceptor: 'userAdmin',
      requiredStack: false,
      keyDismiss: widget.keyPage,
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          backgroundColor: AppTheme.secundaryColor,
          elevation: 20,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                widget.icon,
                color: AppTheme.primaryColor,
                size: 30,
              )
            ],
          ),
          centerTitle: true,
          //  backgroundColor: AppTheme.secundaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            FilledButtonWidget(
              text: 'Agregar ususarios ',
              color: AppTheme.secundaryColor,
              height: 80,
              width: 250,
              onPressed: () {
                final addUserKey = GlobalHelper.genKey();
                fp.addPage(key: addUserKey, content: AddNewUserPage(
                  key: addUserKey,
                  keyPage: addUserKey,
                ));

              },
            ),
            SizedBox(
              height: 20,
            ),
            // FilledButtonWidget(text: 'Agregar usuarios', onPressed: (){},),
            Expanded(
              child: FutureBuilder(
                future: databaseServices.getAllRegistry(),
                builder: (context, snapshot) =>  ListView.builder(
                  itemCount:  databaseServices.usuarios.length ,
                   
                  itemBuilder: (context, index) {
                    final user = databaseServices.usuarios[index];
                    return UserCardWidget(icon: Icons.arrow_circle_right_sharp, onPress: (){}, name: user.name, lastName: user.lastname, email: user.email, acces: user.singin);
                    // return Card(
                    //   clipBehavior: Clip.hardEdge,
                    //   child: SizedBox(
                    //     width: 250,
                        
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    //           child: CircleAvatar(child: Icon(Icons.person),),
                    //         ),
                    //         Column(
                    //           children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text('Nombre: ${user.name}'),
                    //         ),
                    //         Text('Email: ${user.email}'),
                    //         Text('Apellido: ${user.lastname}'),
                        
                    //           ],
                    //         )
                            
                    //       ],
                    //     ),
                    //   ),
                    // );
                  }
                    
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

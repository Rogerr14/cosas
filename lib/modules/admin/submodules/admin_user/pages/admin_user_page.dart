import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/modules/admin/submodules/admin_user/widget/user_card_widget.dart';
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
  @override
  Widget build(BuildContext context) {
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
              SizedBox(width: 10,),
              Icon(widget.icon, color: AppTheme.primaryColor,size: 30,)
            ],
          ),
          centerTitle: true,
          //  backgroundColor: AppTheme.secundaryColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            FilledButtonWidget(text: 'Agregar ususarios ', color: AppTheme.secundaryColor,height: 80, width: 250, onPressed: (){},),
            SizedBox(height: 20,),
            // FilledButtonWidget(text: 'Agregar usuarios', onPressed: (){},),
            Expanded(
              child: ListView.builder(
                itemCount: 10,    
                itemBuilder: (context, index) => UserCardWidget(title: index.toString(), icon: Icons.abc, onPress: (){
                  
                }),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

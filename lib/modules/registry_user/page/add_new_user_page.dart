import 'package:flutter/material.dart';
import 'package:prueba_telconet/modules/registry_user/widget/add_form_widget.dart';
// import 'package:prueba_telconet/modules/auth/register/widget/register_form.dart';
import 'package:prueba_telconet/shared/widget/layout_widget.dart';
import '../../../../env/theme/app_theme.dart';

class AddNewUserPage extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>>? keyPage;

  const AddNewUserPage({Key? key, this.keyPage}) : super(key: key);

  @override
  State<AddNewUserPage> createState() => _AddNewUserPageState();
}

class _AddNewUserPageState extends State<AddNewUserPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutWidget(
      nameInterceptor: 'addUser',
      keyDismiss: widget.keyPage,
      requiredStack: false,
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppTheme.secundaryColor,
          title: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Agregar Usuario', style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor,
                ),),
                SizedBox(width: 10,),
                Icon(Icons.person_add_alt_1, color: AppTheme.primaryColor, size: 20,)
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(height: 20),
              AddFormWidget(keyDismiss: widget.keyPage),
              
            ],
          ),
        ),
      ),
    );
  }
}

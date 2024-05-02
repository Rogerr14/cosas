import 'package:flutter/material.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key, required this.title, required this.icon, required this.onPress,
  });
  final String title;
  final IconData icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppTheme.secundaryColor,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onPress,
          child:  SizedBox(
            width: 350,
            height: 100,
            child: Center(
              child: Row(
                mainAxisAlignment:   MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: TextStyle(color: AppTheme.white, fontSize: 20, fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Icon(icon, color: AppTheme.white, size: 20,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

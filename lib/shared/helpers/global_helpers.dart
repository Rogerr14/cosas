import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:logger/logger.dart';
import 'package:prueba_telconet/shared/routes/app_router.dart';


import '../../modules/404/pages/page_404.dart';

class GlobalHelper {
    static final logger = Logger(printer: PrettyPrinter(methodCount: 0, printEmojis: false));



  static navigateToPageRemove(BuildContext context, String routeName) {
    final route = AppRoutes.routes[routeName];
    final page = (route != null) ? route.call(context) : const PageNotFound();
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        fullscreenDialog: true,
         reverseTransitionDuration: const Duration(milliseconds: 100),
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (context, animation, _) => 
        FadeTransition(
          opacity: animation,
          child: page,
        ),
      ),
      (route) => false,
    );
  }

  static Route navigationFadeIn(BuildContext context, Widget page) {
    return PageRouteBuilder(
      fullscreenDialog: true,
      reverseTransitionDuration: const Duration(milliseconds: 100),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      },
    );
  }

  static GlobalKey genKey() {
    GlobalKey key = GlobalKey();
    return key;
  }

  static String device = (Platform.isAndroid) ? "android" : "ios";

  static dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  
}
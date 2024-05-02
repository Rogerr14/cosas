import 'package:flutter/material.dart';

class FunctionalProvider extends ChangeNotifier {
  List<Widget> alerts = [];
  List<Widget> alertLoading = [];

  addPage({required GlobalKey key, required Widget content}) {
    alerts.add(content);
    notifyListeners();
  }

  dismissAlert({required GlobalKey key}) {
    alerts.removeWhere((alert) => key == alert.key);
    notifyListeners();
  }

    
  clearAllAlert() {
    alerts = [];
    notifyListeners();
  }
}

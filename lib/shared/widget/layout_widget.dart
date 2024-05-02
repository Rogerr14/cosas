import 'package:animate_do/animate_do.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_telconet/env/theme/app_theme.dart';
import 'package:prueba_telconet/shared/provider/functional_provider.dart';
import 'package:prueba_telconet/shared/widget/alert_modal.dart';


class LayoutWidget extends StatefulWidget {
  const LayoutWidget({
    Key? key,     
    required this.child,
    this.requiredStack = true,
    this.keyDismiss, this.nameInterceptor,
  }) : super(key: key);

  final Widget child;
  final bool requiredStack;
  final GlobalKey<State<StatefulWidget>>? keyDismiss;
  final String? nameInterceptor;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  ScrollController _scrollController = ScrollController();
  late FunctionalProvider fp;

 @override
  void initState() {
    BackButtonInterceptor.add(_backButton,
        name: widget.nameInterceptor, context: context);
    _scrollController = ScrollController();
    fp = Provider.of<FunctionalProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    BackButtonInterceptor.removeByName(widget.nameInterceptor.toString());
    super.dispose();
  }

  Future<bool> _backButton(bool button, RouteInfo info) async {
    if (widget.nameInterceptor == null) {
      return true;
    } else {
      final fp = Provider.of<FunctionalProvider>(context, listen: false);
      if (mounted) {
        if (button) return false;
        if (fp.alertLoading.isNotEmpty ||
            (fp.alerts.last.key != widget.keyDismiss)) {
          debugPrint('aqui estoy porque tiene una alerta levantada');
          debugPrint('no debe cerrarse');
          return false;
        }
        debugPrint('la alerta se cerro retrocede');
        fp.dismissAlert(key: widget.keyDismiss!);
      
        return true;
        //HomePage.screenActive = true;
      }
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppTheme.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: BounceInUp(
                  delay: const Duration(milliseconds: 100),
                  child: Container(
                    child: widget.child,
                  ),
                ),
              ),
            ],
          ),
          if (widget.requiredStack) const AlertModal(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/apex_alert.dart';

class AlertHandler {
  static String errorCode200 = '200';
  static String errorCode400 = '400';
  static String errorCode500 = '500';

  void showApexPopup(
      BuildContext context, Widget Function(BuildContext context) build,
      {bool canDismiss = false}) {
    showDialog(
      barrierDismissible: canDismiss,
      context: context,
      builder: build,
    );
  }

  static Widget? showPopup(
      {required BuildContext context,
      required String alert,
        bool hasCloseButton = true,
      Function()? onPressed}) {
    AlertHandler().showApexPopup(context, (context) {
      return ApexAlert(
        alert: alert,
        onPressed: onPressed,
        hasCloseButton: hasCloseButton,
      );
    });
    return null;
  }

  static Widget? showErrorPopup(
      {required BuildContext context, Function()? onPressed, required String error}) {
    AlertHandler().showApexPopup(context, (context) {
      return ApexAlert(
        alert: error,
        onPressed: onPressed,
        isError: true,
      );
    });
    return null;
  }
}

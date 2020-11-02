import 'package:flutter/material.dart';

class ToastUtils {
  static BuildContext _context;

  ToastUtils._();

  static void init(BuildContext context) {
    _context = context;
  }

  static void showToast(String message, {BuildContext context}) {
    OverlayState overlayState = Overlay.of(context ?? _context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (ctx) {
        return Positioned(
          bottom: MediaQuery.of(ctx).size.height * 0.2,
          child: Material(
            child: Container(
              width: MediaQuery.of(ctx).size.width,
              alignment: Alignment.center,
              child: Container(
                child: Text(message),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
          ),
        );
      },
    );
    overlayState.insert(overlayEntry);
    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}

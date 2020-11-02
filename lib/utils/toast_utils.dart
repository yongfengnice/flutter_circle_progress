import 'dart:async';

import 'package:flutter/material.dart';

class ToastUtils {
  static BuildContext _context;
  static OverlayEntry _overlayEntry;
  static Timer _timer;

  ToastUtils._();

  static void init(BuildContext context) {
    _context = context;
  }

  static void showToast(String message, {BuildContext context}) {
    _overlayEntry?.remove();
    _timer?.cancel();
    OverlayState overlayState = Overlay.of(context ?? _context);
    _overlayEntry = OverlayEntry(
      builder: (ctx) {
        return Positioned(
          bottom: MediaQuery.of(ctx).size.height * 0.2,
          child: Material(
            color: Colors.transparent,
            child: Container(
              color: Colors.transparent,
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
    overlayState.insert(_overlayEntry);

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      timer.cancel();
    });
  }
}

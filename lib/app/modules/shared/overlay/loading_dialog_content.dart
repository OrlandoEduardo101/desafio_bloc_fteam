import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

class LoadingDialogContent {
  Widget? child;
  OverlayEntry? _entry;
  bool called = false;

  static final LoadingDialogContent _singleton =
      LoadingDialogContent._internal();

  factory LoadingDialogContent() {
    return _singleton;
  }

  LoadingDialogContent._internal();

  /*LoadingDialogContent._internal();
  static final LoadingDialogContent _singleton =
      LoadingDialogContent._internal();
  factory LoadingDialogContent() => _singleton;*/

  Future<void> hide() async {
    if (_entry != null) {
      _entry?.remove();
      _entry = null;
      called = false;
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  void show({Widget? child}) {
    
    // if (_entry == null) {
    //   _entry = OverlayEntry(
    //     builder: (context) {
    //       return Container(
    //         color: Colors.black.withOpacity(.3),
    //         alignment: Alignment.center,
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   );
    // }
    if(!called){
      called = true;
      WidgetsBinding.instance!.addPostFrameCallback((_) {
      _entry = child == null
          ? OverlayEntry(
              builder: (context) {
                return Container(
                  color: Colors.black.withOpacity(.3),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              },
            )
          : OverlayEntry(
              builder: (context) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.3),
                    //borderRadius: BorderRadius.circular(15),
                  ),
                  child: Material(
                    child: child,
                    color: Colors.transparent,
                  ),
                );
              },
            );
      if (_entry != null) {
        FocusManager.instance.primaryFocus?.unfocus();
        asuka.addOverlay(_entry!);
        // this.child = child;
      }
    }); }
  }

  //   if (_entry?.mounted == true) {
  //     _entry!.remove();
  //     _entry = null;
  //     FocusManager.instance.primaryFocus?.unfocus();
  //     asuka.addOverlay(_entry!);
  //     this.child = child;
  //   } else if (_entry?.mounted == false) {
  //     FocusManager.instance.primaryFocus?.unfocus();
  //     WidgetsBinding.instance?.addPostFrameCallback((_) {
  //       asuka.addOverlay(_entry!);
  //       this.child = child;
  //     });
  //   }
  // }
}

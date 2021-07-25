import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/modules/home/service_locator.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

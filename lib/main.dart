
import 'package:flutter/cupertino.dart';
import 'package:generic_electrical_cost_calculator/routes/route.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:sqlite3/sqlite3.dart';

void main() {
  print('Using sqlite3 ${sqlite3.version}');
  // Create a new in-memory database. To use a database backed by a file, you
  // can replace this with sqlite3.open(yourFilePath).
  final db = sqlite3.openInMemory();


  runApp(
    GetMaterialApp(
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      // translations: ,
      useInheritedMediaQuery: true,
      initialRoute: '/',
      defaultTransition: Transition.native,
      transitionDuration: const Duration(milliseconds: 600),
      getPages: getPages(),
    ),
  );
}

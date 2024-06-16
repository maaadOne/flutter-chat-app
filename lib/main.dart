import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/themes/style.dart';
import 'routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeUtils.defaultTheme,
      initialRoute: Pages.initial,
      getPages: Pages.routes,
    );
  }
}

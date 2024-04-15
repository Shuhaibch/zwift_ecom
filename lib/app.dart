import 'package:ecommerce/bindings/general_bindings.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'ECommerce App',
        themeMode: ThemeMode.system,
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(
          backgroundColor: CColors.primaryColor,
          body: Center(
            child: CircularProgressIndicator(
              color: CColors.whiteColor,
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/search",
      getPages: AppRoutes.routes,
    );
  }
}

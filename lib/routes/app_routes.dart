import 'package:get/get.dart';

import '../presetation/home/home_bindings.dart';
import '../presetation/home/home_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: HomePage.routNamed,
        page: () => const HomePage(),
        binding: HomeBindings())
  ];
}

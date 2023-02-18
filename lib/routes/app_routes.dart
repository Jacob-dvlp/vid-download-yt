import 'package:get/get.dart';

import '../presetation/home/home_bindings.dart';
import '../presetation/home/home_page.dart';
import '../presetation/sheached_video/sheached_video_bindings.dart';
import '../presetation/sheached_video/sheached_video_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: HomePage.routNamed,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: SheachedVideoPage.routNamed,
        page: () => const SheachedVideoPage(),
        binding: SheachedVideoBindings())
  ];
}

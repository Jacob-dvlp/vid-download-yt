import 'package:get/get.dart';

import '../presetation/facebook/facebook_bindings.dart';
import '../presetation/facebook/facebook_page.dart';
import '../presetation/home/home_bindings.dart';
import '../presetation/home/home_page.dart';
import '../presetation/sheached_video/sheached_video_bindings.dart';
import '../presetation/sheached_video/sheached_video_page.dart';
import '../presetation/video_you_tube/video_yt/video_yt_bindings.dart';
import '../presetation/video_you_tube/video_yt/video_yt_page.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
        name: HomePage.routNamed,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
        name: SheachedVideoPage.routNamed,
        page: () => const SheachedVideoPage(),
        binding: SheachedVideoBindings()),
    GetPage(
        name: VideoYtPage.routNamed,
        page: () => const VideoYtPage(),
        binding: VideoYtBindings()),
    GetPage(
        name: FacebookPage.routNamed,
        page: () => const FacebookPage(),
        binding: FacebookBindings()),
  ];
}

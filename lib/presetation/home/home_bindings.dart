import 'package:get/get.dart';

import '../../src/providers/interface_provider_get_video_yt/interface_provider_get_video_yt.dart';
import '../../src/providers/provider_get_video_yt.dart';
import '../../src/repository/interface/interface_get_video_yt.dart';
import '../../src/repository/respository_get_video_yt.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterfaceGetVideoYt>(() => RespostiroyGetVideoYt());
    Get.lazyPut<InterfaceProviderGetVideoYt>(
        () => ProviderGetVideoYt(Get.find()));

    Get.lazyPut(() => HomeController(
          Get.find(),
        ));
  }
}

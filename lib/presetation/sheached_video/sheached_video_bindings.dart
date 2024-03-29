import 'package:get/get.dart';

import '../../src/providers/interface_provider_get_video_yt/interface_provider_get_video_yt.dart';
import '../../src/providers/provider_get_video_yt.dart';
import '../../src/repository/interface/interface_get_video_yt.dart';
import '../../src/repository/respository_get_video_yt.dart';
import 'sheached_video_controller.dart';

class SheachedVideoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterfaceGetVideoYt>(() => RespostiroyGetVideoYt(),
        fenix: true);
    Get.lazyPut<InterfaceProviderGetVideoYt>(
        () => ProviderGetVideoYt(Get.find()),
        fenix: true);

    Get.lazyPut(() => SheachedVideoController(Get.find()),
        fenix: true);
  }
}

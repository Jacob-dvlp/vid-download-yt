import 'package:get/get.dart';

import '../../src/providers/interface_provider_get_video_yt/interface_facebook.dart';
import '../../src/providers/provider_facebook.dart';
import '../../src/repository/interface/interface_facebook.dart';
import '../../src/repository/repository_facebook.dart';
import 'facebook_controller.dart';

class FacebookBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterfaceFacebook>(() => RepositoryFacebook(), fenix: true);
    Get.lazyPut<InterfaceProviderFacebook>(() => ProviderFacebook(Get.find()),
        fenix: true);

    Get.lazyPut(() => FacebookController(Get.find()), fenix: true);
  }
}

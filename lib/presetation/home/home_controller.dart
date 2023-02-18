import 'package:get/get.dart';

import '../../src/model/response_you_tube.dart';
import '../../src/providers/interface_provider_get_video_yt/interface_provider_get_video_yt.dart';

class HomeController extends GetxController with StateMixin {
  final InterfaceProviderGetVideoYt interfaceProviderGetVideoYt;
  List<Item> model = [];
  HomeController(this.interfaceProviderGetVideoYt);

  Future getVideoYT() async {
    try {
      change([], status: RxStatus.loading());
      model = await interfaceProviderGetVideoYt.searchVideoYt("Flutterando");
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    getVideoYT();
    super.onInit();
  }
}

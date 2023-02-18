import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../src/model/response_you_tube.dart';
import '../../src/providers/interface_provider_get_video_yt/interface_provider_get_video_yt.dart';

class SheachedVideoController extends GetxController with StateMixin {
  final InterfaceProviderGetVideoYt interfaceProviderGetVideoYt;
  final TextEditingController searchText = TextEditingController();
  List<Item> model = [];
  bool isLoading = true;
  SheachedVideoController(this.interfaceProviderGetVideoYt);

  Future getVideoYT() async {
    checkVideo(false);
    try {
      model = await interfaceProviderGetVideoYt.searchVideoYt(searchText.text);
      change(Get.toNamed("/home"), status: RxStatus.success());
    } catch (e) {
      print(e);

      change([], status: RxStatus.error());
    }
    checkVideo(true);
  }

  checkVideo(bool value) {
    isLoading = value;
    update();
  }

  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }
}

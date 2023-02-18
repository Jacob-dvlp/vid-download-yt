import 'package:get/get.dart';

import '../../src/repository/respository_get_video_yt.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    RespostiroyGetVideoYt().searchVideoYt();

    super.onInit();
  }
}

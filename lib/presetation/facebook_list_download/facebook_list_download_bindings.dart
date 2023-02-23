import 'package:get/get.dart';
import './facebook_list_download_controller.dart';

class FacebookListDownloadBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(FacebookListDownloadController());
    }
}
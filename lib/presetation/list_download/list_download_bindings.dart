import 'package:get/get.dart';
import './list_download_controller.dart';

class ListDownloadBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ListDownloadController());
    }
}
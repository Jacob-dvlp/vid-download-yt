import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'constant/app_constant.dart';

class Cliente extends DioForNative {
  Dio dio = Dio();
  Cliente() {
    Dio(BaseOptions(baseUrl: AppConstant.baseUrl));
  }
}

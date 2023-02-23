import '../../model/response_facebook.dart';

abstract class InterfaceProviderFacebook {
  Future<ResponseFacebook> facebookdownload({String url});
}

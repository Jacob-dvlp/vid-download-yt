import '../../model/response_facebook.dart';

abstract class InterfaceFacebook {
  Future<ResponseFacebook> facebookdownload({String url});
}

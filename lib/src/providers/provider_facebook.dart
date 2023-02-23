import '../model/response_facebook.dart';
import '../repository/interface/interface_facebook.dart';
import 'interface_provider_get_video_yt/interface_facebook.dart';

class ProviderFacebook implements InterfaceProviderFacebook {
  final InterfaceFacebook interfaceFacebook;

  ProviderFacebook(this.interfaceFacebook);
  @override
  Future<ResponseFacebook> facebookdownload({String? url}) async {
    final response = await interfaceFacebook.facebookdownload(url: url!);
    return response;
  }
}

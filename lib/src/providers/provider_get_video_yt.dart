import '../model/response_you_tube.dart';
import '../repository/interface/interface_get_video_yt.dart';
import 'interface_provider_get_video_yt/interface_provider_get_video_yt.dart';

class ProviderGetVideoYt implements InterfaceProviderGetVideoYt {
  final InterfaceGetVideoYt interfaceGetVideoYt;

  ProviderGetVideoYt(this.interfaceGetVideoYt);
  @override
  Future<List<Item>> searchVideoYt(String value) async {
    final response = await interfaceGetVideoYt.searchVideoYt(value);
    return response;
  }
}

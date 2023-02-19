import '../model/response_download_yt.dart';
import '../repository/interface/interface_download_yt.dart';
import 'interface_provider_get_video_yt/interface_provider_download_yt.dart';

class ProviderDownloadYt implements InterfaceProviderDownloadYt {
  final InterfaceDownloadYt interfaceDownloadYt;

  ProviderDownloadYt(this.interfaceDownloadYt);
  @override
  Future<ResponseDownloadYt> downloadVideoYt({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt(url: url!);

    return response;
  }
}

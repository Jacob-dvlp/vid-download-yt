import '../model/response_download_yt.dart';
import '../repository/interface/interface_download_yt.dart';
import 'interface_provider_get_video_yt/interface_provider_download_yt.dart';

class ProviderDownloadYt implements InterfaceProviderDownloadYt {
  final InterfaceDownloadYt interfaceDownloadYt;

  ProviderDownloadYt(this.interfaceDownloadYt);
  @override
  Future<ResponseDownloadYt> downloadVideoYt1080p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt1080p(url: url!);

    return response;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt480p({String? url}) {
    // TODO: implement downloadVideoYt480p
    throw UnimplementedError();
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt720p({String? url}) {
    // TODO: implement downloadVideoYt720p
    throw UnimplementedError();
  }
}

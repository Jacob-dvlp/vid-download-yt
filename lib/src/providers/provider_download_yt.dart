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
  Future<ResponseDownloadYt> downloadVideoYt720p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt720p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt480p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt480p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt360p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt360p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt240p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt240p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt144p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt144p(url: url!);
    return response;
  }
}

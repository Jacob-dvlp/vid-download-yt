import '../model/reponse_download2.dart';
import '../model/response_download3.dart';
import '../model/response_download4.dart';
import '../model/response_download5.dart';
import '../model/response_download6.dart';
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
  Future<ResponseDownloadYt2> downloadVideoYt720p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt720p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt3> downloadVideoYt480p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt480p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt4> downloadVideoYt360p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt360p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt5> downloadVideoYt240p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt240p(url: url!);
    return response;
  }

  @override
  Future<ResponseDownloadYt6> downloadVideoYt144p({String? url}) async {
    final response = await interfaceDownloadYt.downloadVideoYt144p(url: url!);
    return response;
  }
}

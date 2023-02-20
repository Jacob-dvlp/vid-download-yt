import '../../model/response_download_yt.dart';

abstract class InterfaceProviderDownloadYt {
  Future<ResponseDownloadYt> downloadVideoYt1080p({String url});
  Future<ResponseDownloadYt> downloadVideoYt720p({String url});
  Future<ResponseDownloadYt> downloadVideoYt480p({String url});
}

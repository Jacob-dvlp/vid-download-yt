import '../../model/response_download_yt.dart';

abstract class InterfaceDownloadYt {
  Future<ResponseDownloadYt> downloadVideoYt1080p({String url});
  Future<ResponseDownloadYt> downloadVideoYt720p({String url});
  Future<ResponseDownloadYt> downloadVideoYt480p({String url});
  Future<ResponseDownloadYt> downloadVideoYt360p({String url});
  Future<ResponseDownloadYt> downloadVideoYt240p({String url});
  Future<ResponseDownloadYt> downloadVideoYt144p({String url});
}

import '../../model/response_download_yt.dart';

abstract class InterfaceProviderDownloadYt {
  Future<ResponseDownloadYt> downloadVideoYt({String url});
}

import '../../model/response_download_yt.dart';

abstract class InterfaceDownloadYt {
  Future<ResponseDownloadYt> downloadVideoYt({String url});
}

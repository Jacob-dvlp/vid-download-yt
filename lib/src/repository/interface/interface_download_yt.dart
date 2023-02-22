import '../../model/reponse_download2.dart';
import '../../model/response_download3.dart';
import '../../model/response_download4.dart';
import '../../model/response_download5.dart';
import '../../model/response_download6.dart';
import '../../model/response_download_yt.dart';

abstract class InterfaceDownloadYt {
  Future<ResponseDownloadYt> downloadVideoYt1080p({String url});
  Future<ResponseDownloadYt2> downloadVideoYt720p({String url});
  Future<ResponseDownloadYt3> downloadVideoYt480p({String url});
  Future<ResponseDownloadYt4> downloadVideoYt360p({String url});
  Future<ResponseDownloadYt5> downloadVideoYt240p({String url});
  Future<ResponseDownloadYt6> downloadVideoYt144p({String url});
}

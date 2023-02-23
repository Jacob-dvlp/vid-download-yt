import 'package:http/http.dart' as http;

import '../model/response_facebook.dart';
import 'interface/interface_facebook.dart';

class RepositoryFacebook implements InterfaceFacebook {
  @override
  Future<ResponseFacebook> facebookdownload({String? url}) async {
    ResponseFacebook? facebook;
    final response = await http
        .get(Uri.parse("https://api.akuari.my.id/downloader/fbdl3?link=$url"));
    if (response.statusCode == 200) {
      facebook = responseFacebookFromJson(response.body);
      print(facebook);
    }

    return facebook!;
  }
}

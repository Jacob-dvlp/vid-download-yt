import 'package:http/http.dart' as http;

import '../../helper/constant/app_constant.dart';
import '../model/response_you_tube.dart';
import 'interface/interface_get_video_yt.dart';

class RespostiroyGetVideoYt implements InterfaceGetVideoYt {
  List<Item> modelList = [];
  String url =
      "${AppConstant.baseUrl}search?part=snippet,id&key=${AppConstant.key}&order=date&q=";

  @override
  Future<List<Item>> searchVideoYt(String value) async {
    String fields = "*";
    final response = await http.get(
      Uri.parse("$url+$value&maxResults=80&fields=$fields"),
    );
    final convert = response.body;
    ResponseYouTube model = responseYouTubeFromJson(convert);
    if (response.statusCode == 200) {
      modelList = model.items;
    }
    return modelList;
  }
}

import 'dart:developer';

import 'package:http/http.dart' as http;

class RespostiroyGetVideoYt {
  Uri url = Uri.parse(
      "https://www.googleapis.com/youtube/v3/search?part=snippet,id&key=AIzaSyAuzBbCG5cFw0Fp-TSvztHZSmN3Kojnd4E&order=date&q=Chris brown");
  Future searchVideoYt() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      log(response.body);
    }
  }
}

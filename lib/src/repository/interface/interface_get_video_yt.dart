import '../../model/response_you_tube.dart';

abstract class InterfaceGetVideoYt {
  Future<List<Item>> searchVideoYt(String value);
}

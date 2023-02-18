import '../../model/response_you_tube.dart';

abstract class InterfaceProviderGetVideoYt {
  Future<List<Item>> searchVideoYt(String value);
}

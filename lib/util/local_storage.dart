import 'package:get_storage/get_storage.dart';

class MyPref {
  static final _otherBox = () => GetStorage('MyPref');
  final a = [{}].val('basket');
  void addBasket(Map value) {
    a.val.add(value);
  }

  void removeBasket(value) {
    a.val.remove(value);
  }

  readBasket() {
    return a.val;
  }
}

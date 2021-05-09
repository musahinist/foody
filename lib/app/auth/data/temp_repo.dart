import 'temp.dart';
import 'temp_provider.dart';

class TempRepo {
  TempProvider tempProvider = TempProvider();

  Future<List<Temp>> getReddits() async {
    try {
      final response = await tempProvider.getTemp();
      final List<Temp> temps = response.data['data']
          .map<Temp>((temp) => Temp.fromMap(temp))
          .toList();
      return temps;
    } catch (e) {
      rethrow;
    }
  }
}

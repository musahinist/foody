import 'package:dio/dio.dart';

import '../../../config/abstract_provider.dart';

class TempProvider extends AbstractProvider {
  TempProvider({
    this.path = '',
    this.tag = '',
  }) : super(path, tag);
  final String path;
  final String tag;

  Future<Response> getTemp() async {
    try {
      final Response response =
          await get(innerPath: '', queryParameters: {'': ''});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

abstract class HttpApiServices {
  Future<dynamic> httpGetMethod({required String url, bool haveHeader = false});
  Future<dynamic> httpPostMethod(
      {required String url, bool haveHeader = false, required Map data});
}

import 'package:http/http.dart' as http;

class HttpWrapper {
  Future<http.Response> get({required String path, required String host}) {
    return http.get(Uri.https(host, path));
  }
}

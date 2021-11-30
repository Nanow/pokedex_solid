import 'package:http/http.dart' as http;

class HttpWrapper {
  Future<http.Response> get({required String url}) {
    return http.get(Uri(path: url));
  }
}

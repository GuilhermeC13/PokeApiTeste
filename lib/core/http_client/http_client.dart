import 'package:http/http.dart';

abstract class HttpClient {
  Future<Response> get(String url);
}

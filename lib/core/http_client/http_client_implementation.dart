import 'package:http/http.dart';
import 'package:poke_api_teste/core/http_client/http_client.dart';

class HttpImplementation implements HttpClient {
  final client = Client();

  @override
  Future<Response> get(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );

    return Response(response.body, response.statusCode);
  }
}

import 'package:http/http.dart' as http;

class Summaryjaon {
  Future<http.Response> post(String url1) async {
    var url = Uri.parse(url1);
    var response = await http.post(url);
    return response;
  }
}
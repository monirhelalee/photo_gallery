import 'package:http/http.dart' as http;
import 'package:photo_gallery/resource/urls.dart';

class ApiClient {
  http.Client httClient = http.Client();

  Future<http.Response> getRequest(String url) async {
    var completeUrl = _buildUrl(url);
    return httClient.get(Uri.parse(completeUrl));
  }

  _buildUrl(String partialUrl) {
    String baseUrl = Urls.baseUrl;
    return baseUrl + partialUrl;
  }
}

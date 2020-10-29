import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weatherApp/common/constants.dart';
import 'dart:convert';

class APIService {
  // API key
  static const _api_key = AppConstants.api_key;
  // 'fada45a7c4mshfd97ec4668c1499p18707bjsn5e845d1b666b';
  // Base API url
  static const String _baseUrl = "community-open-weather-map.p.rapidapi.com";
  // Base headers for Response url
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };

  Future<dynamic> get({
    @required String endpoint,
    @required Map<String, String> query,
  }) async {
    Uri uri = Uri.https(_baseUrl, endpoint, query);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load json data');
    }
  }
}

import 'dart:convert';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:sample_riverpod/model/interest_response.dart';

class ApiService {
  String endpoint = 'https://api.cupidquest.net/interests';

  Future<List<Interests>> getInterests() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['interests'];
      return result.map(((e) => Interests.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());

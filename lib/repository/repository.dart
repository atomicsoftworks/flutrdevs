import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Repository {
  final _dio = Dio();
  final _baseUrl = 'https://BASE_URL/api/v1';

  Future<void> subscribe(String email) async {
    try {
      await _dio.post(
        '$_baseUrl/subscribe',
        data: {
          'email': email,
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

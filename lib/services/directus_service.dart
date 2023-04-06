import 'package:dio/dio.dart';

import '../models/stores.dart';

class DirectusService {
  late Dio _dio;

  DirectusService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.111:8055/',
      // headers: {
      //   'Authorization': 'Bearer your-directus-api-key',
      // },
    ));
  }

  Future<List<Store>> getStores() async {
    final response = await _dio.get('/items/stores');

    if (response.statusCode == 200) {
      final data = response.data['data'] as List<dynamic>;
      return data.map((item) => Store.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch stores');
    }
  }
}

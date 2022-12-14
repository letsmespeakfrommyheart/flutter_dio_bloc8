import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc8/model/list_user_response.dart';

class ListUserProvider {
  late Dio _dio;

  final url = "https://reqres.in/api/users?page=2";

  ListUserProvider() {
    _dio = Dio(BaseOptions(
      baseUrl: url,
    ));

    initializeInterceptors();
  }

  Future<List<User>> getRequest() async {
    Response response;

    response = await _dio.get(url);
    if (response.statusCode == 200) {
      final usersList = ListUserResponse.fromJson(response.data);
      return usersList.users;
    } else {
      throw Exception('Error fetching users');
    }
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      log('error ${error.message}');
      return handler.next(error);
    }, onRequest: (request, handler) {
      log('request: ${request.data}');
      return handler.next(request);
    }, onResponse: (response, handler) {
      log('response: ${response.data}');
      return handler.next(response);
    }));
  }
}

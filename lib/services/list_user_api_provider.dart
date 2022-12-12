import 'package:dio/dio.dart';

class ListUserProvider {
  late Dio _dio;

  final url = "https://reqres.in/api/users?page=2";

  ListUserProvider() {
    _dio = Dio(BaseOptions(
      baseUrl: url,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest() async {
    Response response;

    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      return handler.next(error);
    }, onRequest: (request, handler) {
      return handler.next(request);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }));
  }
}

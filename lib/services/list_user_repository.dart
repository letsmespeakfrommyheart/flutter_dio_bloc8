import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc8/services/list_user_api_provider.dart';

class ListUserRepository {
  final ListUserProvider _listUserProvider = ListUserProvider();
  Future<Response> getAllUsers() => _listUserProvider.getRequest();
}

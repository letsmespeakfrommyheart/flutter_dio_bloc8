import 'package:flutter_dio_bloc8/model/list_user_response.dart';
import 'package:flutter_dio_bloc8/services/list_user_api_provider.dart';

class ListUserRepository {
  final ListUserProvider _listUserProvider = ListUserProvider();
  Future<List<User>> getAllUsers() => _listUserProvider.getRequest();
}

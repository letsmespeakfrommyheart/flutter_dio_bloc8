import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc8/model/list_user_response.dart';

abstract class ListUserState {}

class ListUserEmptyState extends ListUserState {}

class ListUserLoadingState extends ListUserState {}

class ListUserLoadedState extends ListUserState {
  List<Response<dynamic>> loadedList;
  ListUserLoadedState({
    required this.loadedList,
  });
}

class ListUserErrorState extends ListUserState {}

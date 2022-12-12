import 'package:flutter_dio_bloc8/model/list_user_response.dart';

abstract class ListUserState {}

class ListUserEmptyState extends ListUserState {}

class ListUserLoadingState extends ListUserState {}

class ListUserLoadedState extends ListUserState {
  List<User> loadedUser;
  ListUserLoadedState({
    required this.loadedUser,
  });
}

class ListUserErrorState extends ListUserState {}

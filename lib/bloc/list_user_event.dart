part of 'list_user_bloc.dart';

abstract class ListUserEvent {}

class ListUserLoadindEvent extends ListUserEvent {}

class NoInternetEvent extends ListUserEvent {}

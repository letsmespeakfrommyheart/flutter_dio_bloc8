part of 'list_user_bloc.dart';

abstract class ListUserEvent {}

class ListUserLoadindEvent extends ListUserEvent {}

class ListUserErrorEvent extends ListUserEvent {}

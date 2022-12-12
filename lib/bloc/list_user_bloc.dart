import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_bloc8/bloc/list_user_event.dart';
import 'package:flutter_dio_bloc8/bloc/list_user_state.dart';
import 'package:flutter_dio_bloc8/model/list_user_response.dart';
import 'package:flutter_dio_bloc8/services/list_user_repository.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  final ListUserRepository userListRepository;
  ListUserBloc({required this.userListRepository})
      : super(ListUserEmptyState()) {
    on<ListUserLoadEvent>(
      (event, emit) async {
        emit(ListUserLoadingState());

        // try {
        //   final List<Response<dynamic>> loadedListUser =
        //       // await userListRepository.getAllUsers();
        //       // emit(ListUserLoadedState(loadedList: loadedListUser));
        // } catch (_) {
        //   emit(ListUserErrorState());
        // }
      },
    );
    on<ListUserClearEvent>(
      (event, emit) async {
        emit(ListUserEmptyState());
      },
    );
  }
}

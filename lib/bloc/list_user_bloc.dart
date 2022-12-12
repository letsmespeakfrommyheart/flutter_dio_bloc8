import 'package:bloc/bloc.dart';
import 'package:flutter_dio_bloc8/bloc/list_user_state.dart';
import 'package:flutter_dio_bloc8/model/list_user_response.dart';
import 'package:flutter_dio_bloc8/services/list_user_repository.dart';
part 'list_user_event.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {
  final ListUserRepository userRepository;

  ListUserBloc({required this.userRepository}) : super(ListUserLoadingState()) {
    on<ListUserLoadindEvent>(
      (event, emit) async {
        emit(ListUserLoadingState());
        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(ListUserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(ListUserErrorState());
        }
      },
    );
  }
}

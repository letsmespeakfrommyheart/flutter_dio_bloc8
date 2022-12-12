import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_bloc8/bloc/list_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_bloc8/services/list_user_repository.dart';
import 'package:flutter_dio_bloc8/widgets/user_listview.dart';

class ListUserScreen extends StatelessWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  // final userRepository = ListUserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => ListUserRepository(),
        child: BlocProvider(
            create: (context) =>
                ListUserBloc(userRepository: context.read<ListUserRepository>())
                  ..add(ListUserLoadindEvent()),
            child: Scaffold(
              appBar: AppBar(title: const Text("Get list of users")),
              body: const UserList(),
            )));
  }
}

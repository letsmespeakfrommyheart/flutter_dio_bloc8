import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio_bloc8/bloc/list_user_bloc.dart';
import 'dart:developer';
import 'package:flutter_dio_bloc8/bloc/list_user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListUserBloc, ListUserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is ListUserLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is ListUserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ListUserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.loadedUser[index].avatar),
                    radius: 50),
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(state.loadedUser[index].firstName),
                  const SizedBox(width: 5),
                  Text(state.loadedUser[index].lastName)
                ]),
                subtitle:
                    Column(children: [Text(state.loadedUser[index].email)]),
                trailing: const Icon(Icons.call_made_rounded)),
          );
        } else if (state is ListUserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

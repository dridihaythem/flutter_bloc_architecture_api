import 'package:bloc_architecture/business_logic/users/users_cubit.dart';
import 'package:bloc_architecture/ui/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) => UserWidget(state.users[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.users.length,
          );
        } else if (state is UsersLoading) {
          return const CircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}

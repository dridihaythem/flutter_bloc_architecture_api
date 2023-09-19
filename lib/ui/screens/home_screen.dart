import 'package:bloc_architecture/business_logic/app/app_cubit.dart';
import 'package:bloc_architecture/business_logic/posts/posts_cubit.dart';
import 'package:bloc_architecture/business_logic/users/users_cubit.dart';
import 'package:bloc_architecture/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:bloc_architecture/ui/widgets/show_error_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) =>
              current is AppBottomNavigationBarChanged,
          builder: (context, state) {
            return Text(
              context
                  .read<AppCubit>()
                  .titles[(state as AppBottomNavigationBarChanged).index],
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MultiBlocListener(
          listeners: [
            BlocListener<UsersCubit, UsersState>(
              listener: (context, state) {
                if (state is UsersError) {
                  showErrorAlertDialog(
                    context,
                    title: 'Error',
                    content: 'Error loading users',
                    onTap: () {
                      context.read<UsersCubit>().getAllUsers();
                    },
                  );
                }
              },
            ),
            BlocListener<PostsCubit, PostsState>(
              listener: (context, state) {
                if (state is PostsError) {
                  showErrorAlertDialog(
                    context,
                    title: 'Error',
                    content: 'Error loading posts',
                    onTap: () {
                      context.read<PostsCubit>().getAllPosts(
                            (context.read<UsersCubit>().state as UsersLoaded)
                                .users,
                          );
                    },
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) =>
                current is AppBottomNavigationBarChanged,
            builder: (context, state) {
              return Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.height,
                ),
                child: context
                    .read<AppCubit>()
                    .pages[(state as AppBottomNavigationBarChanged).index],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

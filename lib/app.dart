import 'package:bloc_architecture/business_logic/app/app_cubit.dart';
import 'package:bloc_architecture/business_logic/posts/posts_cubit.dart';
import 'package:bloc_architecture/business_logic/users/users_cubit.dart';
import 'package:bloc_architecture/data/dataproviders/posts_data_provider.dart';
import 'package:bloc_architecture/data/dataproviders/users_data_provider.dart';
import 'package:bloc_architecture/data/repositories/posts_repository.dart';
import 'package:bloc_architecture/data/repositories/users_repository.dart';
import 'package:bloc_architecture/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UsersRepository(
            UsersDataProvider(),
          ),
        ),
        RepositoryProvider(
          create: (context) => PostsRepository(
            PostsDataProvider(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
            create: (context) =>
                UsersCubit(context.read<UsersRepository>())..getAllUsers(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => PostsCubit(
              context.read<UsersCubit>(),
              context.read<PostsRepository>(),
            ),
          )
        ],
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
  }
}

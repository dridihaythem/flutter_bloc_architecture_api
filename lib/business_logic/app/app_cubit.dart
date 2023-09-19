import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/ui/screens/posts_screen.dart';
import 'package:bloc_architecture/ui/screens/users_screen.dart';
import 'package:flutter/material.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppBottomNavigationBarChanged(0));

  final List<Widget> pages = [
    const PostsScreen(),
    const UsersScreen(),
  ];

  final List<String> titles = [
    'Posts',
    'Users',
  ];

  void changeBottomNavigationBar(int index) {
    emit(AppBottomNavigationBarChanged(index));
  }
}

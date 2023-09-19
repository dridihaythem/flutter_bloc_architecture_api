import 'package:bloc_architecture/business_logic/app/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          current is AppBottomNavigationBarChanged,
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (value) {
            context.read<AppCubit>().changeBottomNavigationBar(value);
          },
          currentIndex: (state as AppBottomNavigationBarChanged).index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Users',
            ),
          ],
        );
      },
    );
  }
}

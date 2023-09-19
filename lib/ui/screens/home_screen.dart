import 'package:bloc_architecture/business_logic/app/app_cubit.dart';
import 'package:bloc_architecture/ui/widgets/custom_bottom_navigation_bar.dart';
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
      body: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) =>
            current is AppBottomNavigationBarChanged,
        builder: (context, state) {
          return context
              .read<AppCubit>()
              .pages[(state as AppBottomNavigationBarChanged).index];
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

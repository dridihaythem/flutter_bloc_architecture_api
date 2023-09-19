import 'package:bloc_architecture/business_logic/posts/posts_cubit.dart';
import 'package:bloc_architecture/ui/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) => PostWidget(state.posts[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.posts.length,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

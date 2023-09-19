import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/business_logic/users/users_cubit.dart';
import 'package:bloc_architecture/data/models/post.dart';
import 'package:bloc_architecture/data/models/user.dart';
import 'package:bloc_architecture/data/repositories/posts_repository.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final UsersCubit _usersCubit;
  final PostsRepository _postsRepository;

  PostsCubit(this._usersCubit, this._postsRepository) : super(PostsInitial()) {
    _usersCubit.stream.listen((state) {
      if (state is UsersLoaded) {
        getAllPosts(state.users);
      }
    });
  }

  void getAllPosts(List<User> users) async {
    try {
      emit(PostsLoading());
      List<Post> posts = await _postsRepository.getAllPosts(users);
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError());
    }
  }
}

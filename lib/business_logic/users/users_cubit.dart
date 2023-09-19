import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/models/user.dart';
import 'package:bloc_architecture/data/repositories/users_repository.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository _usersRepository;

  UsersCubit(this._usersRepository) : super(UsersInitial());

  void getAllUsers() async {
    try {
      emit(UsersLoading());
      List<User> users = await _usersRepository.getAllUsers();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersError());
    }
  }
}

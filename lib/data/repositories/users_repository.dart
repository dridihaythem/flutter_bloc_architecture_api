import 'package:bloc_architecture/data/dataproviders/users_data_provider.dart';
import 'package:bloc_architecture/data/models/user.dart';

class UsersRepository {
  final UsersDataProvider _usersDataProvider;

  const UsersRepository(this._usersDataProvider);

  Future<List<User>> getAllUsers() async {
    List data = await _usersDataProvider.getAllUsers();
    return data.map((e) => User.fromMap(e)).toList();
  }
}

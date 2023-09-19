import 'package:bloc_architecture/data/models/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final User user;
  const UserWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          user.id.toString(),
        ),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}

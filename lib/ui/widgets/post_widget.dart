import 'package:bloc_architecture/data/models/post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(31, 181, 180, 180),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromARGB(255, 181, 180, 180),
          ),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            post.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(post.body),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(post.user.name),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(post.user.email),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

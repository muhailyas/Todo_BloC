import 'package:flutter/material.dart';

import '../../../model/todo_model.dart';
import '../../../utils/constants.dart';

class TodoCardTileWidget extends StatelessWidget {
  const TodoCardTileWidget({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 27, 26, 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                todo.title,
                style: const TextStyle(color: Colors.white, fontSize: 23),
              ),
            ]),
            kHeight10,
            Text(
              todo.description,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

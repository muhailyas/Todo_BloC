import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/todo_model.dart';
import '../../../utils/constants.dart';

class TodoCardTileWidget extends StatelessWidget {
  const TodoCardTileWidget({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xFF2C3E50),
          Color(0xFFBDC3C7),
        ]),
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
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            ]),
            kHeight10,
            Text(
              todo.description,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}

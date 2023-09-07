import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc/todo_bloc_bloc.dart';

import '../../model/todo_model.dart';
import '../../utils/constants.dart';
import '../widgets/text_form_field_widget.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Make your todo",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                TextFieldWidget(
                  hintText: "Title",
                  controller: titleController,
                  height: 75,
                ),
                kHeight10,
                TextFieldWidget(
                  hintText: "Description",
                  maximumLine: 6,
                  height: 170,
                  controller: descriptionController,
                ),
                kHeight20,
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<TodoBlocBloc, TodoBlocState>(
                        builder: (context, state) {
                          if (state.isSaving) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey),
                                fixedSize:
                                    MaterialStatePropertyAll(Size(255, 45))),
                            onPressed: () {
                              validate(context);
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 1),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(140, 45))),
                          onPressed: () {
                            formKey.currentState!.reset();
                          },
                          child: const Text(
                            "Clear All",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final newTodo = Todo(
        title: titleController.text,
        description: descriptionController.text,
        isCompleted: true,
      );
      try {
        context.read<TodoBlocBloc>().add(TodoAddEvent(todo: newTodo));
      } catch (e) {
        print(e);
      }
      formKey.currentState!.reset();
    }
  }
}

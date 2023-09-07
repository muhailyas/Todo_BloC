import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/view/add/add_screen.dart';
import 'package:todo_bloc/view/home/widgets/todo_card_tile_widget.dart';
import '../../utils/constants.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<TodoBlocBloc>().add(TodoFetchEvent());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "All Notes",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<TodoBlocBloc>().add(TodoFetchEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TodoBlocBloc, TodoBlocState>(
            builder: (context, state) {
              print(state.todoList);
              if (state.isFetching) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return TodoCardTileWidget(
                    todo: state.todoList[index],
                  );
                },
                itemCount: state.todoList.length,
                separatorBuilder: (context, index) => kHeight20,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenAdd(),
          ),
        ),
      ),
    );
  }
}

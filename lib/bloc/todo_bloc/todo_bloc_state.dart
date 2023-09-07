part of 'todo_bloc_bloc.dart';

class TodoBlocState {
  bool isFetching;
  List<Todo> todoList;
  bool isSaving;
  TodoBlocState({
    this.isFetching = false,
    required this.todoList,
    this.isSaving = false,
  });
}

final class TodoBlocInitial extends TodoBlocState {
  TodoBlocInitial():super(todoList: []);
}

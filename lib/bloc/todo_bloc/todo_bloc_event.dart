part of 'todo_bloc_bloc.dart';

class TodoBlocEvent {}

class TodoAddEvent extends TodoBlocEvent {
  final Todo todo;
  TodoAddEvent({required this.todo});
}

class TodoFetchEvent extends TodoBlocEvent {}

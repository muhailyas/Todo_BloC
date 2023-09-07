import 'package:bloc/bloc.dart';
import 'package:todo_bloc/api/api_services.dart';
import 'package:todo_bloc/model/todo_model.dart';
part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {
    on<TodoAddEvent>((event, emit) async {
      emit(TodoBlocState(todoList: [], isSaving: true));
      await ApiServices().createTodo(event.todo);
      final todos = await ApiServices().fetchTodos();
      return emit(TodoBlocState(todoList: todos, isSaving: false));
    });
    on<TodoFetchEvent>((event, emit) async {
      emit(TodoBlocState(todoList: [], isFetching: true));
      final todos = await ApiServices().fetchTodos();
      return emit(TodoBlocState(todoList: todos, isFetching: false));
    });
  }
}

part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class Loading extends HomePageState {}

class Loaded extends HomePageState {
  const Loaded({required this.list});

  final List<Game> list;
}

class Empty extends HomePageState {}

class Error extends HomePageState {
  const Error({
    required this.message,
  });
  final String message;
}

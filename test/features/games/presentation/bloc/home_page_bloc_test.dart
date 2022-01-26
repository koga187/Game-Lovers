import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers_app/features/games/domain/usecases/list_games.dart';
import 'package:game_lovers_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockListGames extends Mock implements ListGames {}

void main() {
  HomePageBloc bloc;
  MockListGames mockListGames;

  setUp(() {
    mockListGames = MockListGames();

    bloc = HomePageBloc(listGames: mockListGames);
  });
}

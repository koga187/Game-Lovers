import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_lovers_app/features/games/data/model/game_model.dart';
import 'package:game_lovers_app/features/games/domain/usecases/list_games.dart';
import 'package:game_lovers_app/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockListGames extends Mock implements ListGames {}

void main() {
  late MockListGames mockListGames;

  const tLimit = 10;
  const tOffset = 10;
  const tIdPlatform = 1;
  const tGameModel = GameModel(
    id: 1,
    name: 'text name',
    description: 'text description',
    imageUrl: 'url image',
    genres: ['genres', 'name'],
    platforms: ['platforms', 'name'],
  );

  setUp(() {
    mockListGames = MockListGames();
  });

  group(
    'HomePageBloc',
    () {
      blocTest<HomePageBloc, HomePageState>(
        'emits [Loading, Loaded] when MyEvent is added',
        build: () => HomePageBloc(listGames: mockListGames),
        setUp: () {
          when(
            () => mockListGames.call(
              const ListGamesParams(
                  idPlatform: tIdPlatform, limit: tLimit, offset: tOffset),
            ),
          ).thenAnswer((_) async => const Right([tGameModel]));
        },
        act: (bloc) => bloc.add(
          const ListGamesEvent(
              idPlatform: tIdPlatform, limit: tLimit, offset: tOffset),
        ),
        expect: () => [
          Loading(),
          const Loaded(list: [tGameModel])
        ],
      );
    },
  );
}

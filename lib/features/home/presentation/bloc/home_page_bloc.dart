import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_lovers_app/core/error/failure.dart';
import 'package:game_lovers_app/features/games/domain/entities/game.dart';
import 'package:game_lovers_app/features/games/domain/usecases/list_games.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final ListGames listGames;
  HomePageBloc({required this.listGames}) : super(HomePageInitial()) {
    on<ListGamesEvent>((event, emit) async {
      emit(Loading());

      final failureOrList = await listGames(
        ListGamesParams(
            limit: event.limit,
            offset: event.offset,
            idPlatform: event.idPlatform),
      );
      emit(
        failureOrList.fold(
          (l) => Error(
              message: mapFailureToMessage(
            l,
          )),
          (r) {
            return Loaded(
              list: r,
            );
          },
        ),
      );
    });
  }
}

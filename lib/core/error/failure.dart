import 'package:equatable/equatable.dart';
import 'package:game_lovers_app/core/values/texts_game_lovers.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class TooManyRequestsFailre extends Failure {}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return TextsGameLovers.serveFailure;
    case CacheFailure:
      return TextsGameLovers.cacheFailureMsg;
    case TooManyRequestsFailre:
      return TextsGameLovers.tooManyRequests;
    default:
      return TextsGameLovers.unexpectedFailureMsg;
  }
}

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';

abstract class IAnimesState {}

class AnimesSucces implements IAnimesState {
  final ListAnimesResponse listAnimes;

  AnimesSucces(this.listAnimes);
}

class AnimesStart implements IAnimesState {}

class AnimesLoading implements IAnimesState {}

class AnimesError implements IAnimesState {
  final IHomeFormatterFailure erro;

  AnimesError(this.erro);
}
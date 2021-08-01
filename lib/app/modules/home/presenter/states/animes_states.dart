import '../../domain/entities/response/list_animes_entity.dart';
import '../../domain/errors/errors/errors.dart';

abstract class IAnimesState {}

class AnimesSucces implements IAnimesState {
  List<ListAnimesEntity> listAnimes;

  AnimesSucces({this.listAnimes = const []});
}

class AnimesStart implements IAnimesState {
  List<ListAnimesEntity> listAnimes;

  AnimesStart({this.listAnimes = const []});
}

class AnimesLoading implements IAnimesState {}

class AnimesError implements IAnimesState {
  final IHomeFormatterFailure erro;

  AnimesError(this.erro);
}

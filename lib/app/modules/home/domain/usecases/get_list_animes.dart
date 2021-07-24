import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/repository/i_get_list_animes_repository.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/utils/either/custom_either.dart';

abstract class IGetListAnimes {
  Future<CustomEither<IHomeFormatterFailure, ListAnimesResponse>> call(
      GetAnimesListParam params);
}

class GetListAnimes implements IGetListAnimes {
  final IGetListAnimesRepository _repository;
  GetListAnimes(
    this._repository,
  );
  @override
  Future<CustomEither<IHomeFormatterFailure, ListAnimesResponse>> call(GetAnimesListParam params) async {
    return _repository.getListAnimes(params);
  }
}

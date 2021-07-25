import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/repository/i_get_list_animes_repository.dart';
import 'package:desafio_bloc_fteam/app/modules/home/infra/datasources/i_get_list_animes_datasource.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/utils/either/custom_either.dart';

class GetListAnimesRepository implements IGetListAnimesRepository {
  final IGetListAnimesDatasource _datasource;

  GetListAnimesRepository(this._datasource);

  @override
  Future<CustomEither<IHomeFormatterFailure, ListAnimesResponse>> getListAnimes(
      GetAnimesListParam params) async {
    try {
      return SuccessResponse(await _datasource.getListAnimes(params));
    } on IHomeFormatterFailure catch (e) {
      return FailureResponse(HomeFormatterDatasourceError(message: e.message));
    }
  }
}

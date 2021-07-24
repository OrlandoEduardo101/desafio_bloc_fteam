import '../../../shared/utils/either/custom_either.dart';
import '../entities/params/get_animes_list_param.dart';
import '../entities/response/list_animes_response.dart';
import '../errors/errors/errors.dart';

abstract class IGetListAnimesRepository {
  Future<CustomEither<IHomeFormatterFailure, ListAnimesResponse>> getListAnimes(GetAnimesListParam params);
}
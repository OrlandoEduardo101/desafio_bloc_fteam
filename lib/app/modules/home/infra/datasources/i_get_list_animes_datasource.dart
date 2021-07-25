import '../../domain/entities/params/get_animes_list_param.dart';
import '../../domain/entities/response/list_animes_response.dart';

abstract class IGetListAnimesDatasource {
  Future<ListAnimesResponse> getListAnimes(GetAnimesListParam params);
}
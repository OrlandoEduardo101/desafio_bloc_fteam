import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/external/formatters/response/list_animes_response_formatter.dart';
import 'package:desafio_bloc_fteam/app/modules/home/infra/datasources/i_get_list_animes_datasource.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/constants/api_endpoints.dart';
import 'package:dio/dio.dart';

class GetListAnimesDatasource implements IGetListAnimesDatasource {
  final Dio _httpClient;

  GetListAnimesDatasource(this._httpClient);

  
  @override
  Future<ListAnimesResponse> getListAnimes(GetAnimesListParam params) async {
    try {
      
      final response = await _httpClient.get('${ApiEndpoints.posts}&page=${params.page}&per_page=${params.perPage}');
      
      var entity;
      if (response.statusCode.toString().startsWith('2')) {
        entity = ListAnimesResponseFormatter().fromMap({'listAnimes': response.data});
      }
      return entity;
    } on DioError catch (e) {
      if (e.error == null) {
        throw HomeFormatterDatasourceError(message: 'Falha na conexão');
      } else if (e.error == 'Http status error [401]') {
        throw HomeFormatterDatasourceError(
            message: '${e.response?.data['message'] ?? 'invalid_parameters'}');
      }
      throw HomeFormatterDatasourceError(message: '${e.response?.data['message'] ?? 'Falha na conexão'}');
    } 
  }
  
}
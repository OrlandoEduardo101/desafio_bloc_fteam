import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../shared/constants/api_endpoints.dart';
import 'domain/repository/i_get_list_animes_repository.dart';
import 'domain/usecases/get_list_animes.dart';
import 'external/datasources/get_list_animes_datasource.dart';
import 'infra/datasources/i_get_list_animes_datasource.dart';
import 'infra/repositories/get_list_animes_repository.dart';
import 'presenter/animes_list_cubit.dart';

GetIt getIt = GetIt.instance;


class ServiceLocator {
  static Future<void> init() async {

    //libs
    getIt.registerSingleton<Dio>(Dio(BaseOptions(
      baseUrl: ApiEndpoints.urlBase
    )));

    //external
    getIt.registerSingleton<IGetListAnimesDatasource>(GetListAnimesDatasource(getIt.get<Dio>()));
    
    //infra
    getIt.registerSingleton<IGetListAnimesRepository>(GetListAnimesRepository(getIt.get<IGetListAnimesDatasource>()));
    
    //domain
    getIt.registerSingleton<IGetListAnimes>(GetListAnimes(getIt.get<IGetListAnimesRepository >()));
    
    //presenter
    getIt.registerSingleton<GetAnimesListCubit>(GetAnimesListCubit(getIt.get<IGetListAnimes>()));
    
  }
}

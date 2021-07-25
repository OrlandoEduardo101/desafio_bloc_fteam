import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/repository/i_get_list_animes_repository.dart';
import 'package:desafio_bloc_fteam/app/modules/home/infra/datasources/i_get_list_animes_datasource.dart';
import 'package:desafio_bloc_fteam/app/modules/home/infra/repositories/get_list_animes_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetLisAnimesMock extends Mock implements IGetListAnimesDatasource {}

main() {
  late IGetListAnimesRepository repository;
  late IGetListAnimesDatasource datasource;

  setUp(() {
    datasource = GetLisAnimesMock();
    repository = GetListAnimesRepository(datasource);
    registerFallbackValue(GetAnimesListParam());
  });

  test('Must return ListAnimesResponse with success', () async {
    when(() => datasource.getListAnimes(any())).thenAnswer(
        (invocation) async => ListAnimesResponse());

    var result = await repository.getListAnimes(GetAnimesListParam());

    expect(result.fold(onSuccess: (r) => r, onFailure: (l) => l),
        isA<ListAnimesResponse>());
  });

  test('Must return IHomeFormatterFailure with FailureResponse', () async {
    when(() => datasource.getListAnimes(any())).thenThrow(HomeFormatterDatasourceError());

    var result = await repository.getListAnimes(GetAnimesListParam());

    expect(result.fold(onSuccess: (r) => r, onFailure: (l) => l), isA<IHomeFormatterFailure>());
  });

}
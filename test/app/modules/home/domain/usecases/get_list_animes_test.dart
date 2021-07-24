import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/repository/i_get_list_animes_repository.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/usecases/get_list_animes.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/utils/either/custom_either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IGetListAnimesRepository {}

void main() {
  late IGetListAnimesRepository _repository;
  late IGetListAnimes usecase;
  setUpAll(() {
    _repository = RepositoryMock();
    usecase = GetListAnimes(_repository);
    registerFallbackValue(GetAnimesListParam());
  });

  test('Must return ListAnimesResponse with success', () async {
    when(() => _repository.getListAnimes(any())).thenAnswer(
        (invocation) async => SuccessResponse<IHomeFormatterFailure, ListAnimesResponse>(ListAnimesResponse()));

    var result = await usecase(GetAnimesListParam());

    expect(result.fold(onSuccess: (r) => r, onFailure: (l) => l),
        isA<ListAnimesResponse>());
  });

  test('Must return IHomeFormatterFailure with FailureResponse', () async {
    when(() => _repository.getListAnimes(any())).thenAnswer(
        (invocation) async => FailureResponse<IHomeFormatterFailure, ListAnimesResponse>(NotValidCodeParam()));

    var result = await usecase(GetAnimesListParam());

    expect(result.fold(onSuccess: (r) => r, onFailure: (l) => l),
        isA<IHomeFormatterFailure>());
  });

}

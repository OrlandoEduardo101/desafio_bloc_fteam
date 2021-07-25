import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/usecases/get_list_animes.dart';
import 'package:desafio_bloc_fteam/app/modules/home/presenter/animes_list_cubit.dart';
import 'package:desafio_bloc_fteam/app/modules/home/presenter/states/animes_states.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/utils/either/custom_either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UsecaseMock extends Mock implements IGetListAnimes {}
class MockAnimesCubit extends MockCubit<IAnimesState> implements GetAnimesListCubit {}


void main() {
  final usecase = UsecaseMock();
  final cubit = GetAnimesListCubit(usecase);

  setUpAll(() {
    registerFallbackValue(GetAnimesListParam());
  });

  test('must return states in the correct order', () {
    when(() => usecase.call(any())).thenAnswer((_) async =>
        SuccessResponse<IHomeFormatterFailure, ListAnimesResponse>(
            ListAnimesResponse()));

    expect(
        cubit,
        emitsInOrder([
          isA<AnimesLoading>(),
          isA<AnimesSucces>(),
        ]));
  });

  test('deve retornarum erro', () {
    when(() => usecase.call(any())).thenAnswer((_) async =>
        FailureResponse<IHomeFormatterFailure, ListAnimesResponse>(
            NotValidCodeParam()));

    expect(
        cubit,
        emitsInOrder([
          isA<AnimesLoading>(),
          isA<AnimesError>(),
        ]));
  });
}

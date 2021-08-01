import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/usecases/get_list_animes.dart';
import 'package:desafio_bloc_fteam/app/modules/home/presenter/animes_list_bloc.dart';
import 'package:desafio_bloc_fteam/app/modules/home/presenter/states/animes_states.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/utils/either/custom_either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UsecaseMock extends Mock implements IGetListAnimes {}

void main() {
  late IGetListAnimes usecase;
  late GetAnimesListBloc bloc;

  setUpAll(() {
    usecase = UsecaseMock();
    bloc = GetAnimesListBloc(usecase);
    registerFallbackValue(GetAnimesListParam());
  });

  test('must return states in the correct order', () {
    when(() => usecase.call(any())).thenAnswer(
        (_) async => SuccessResponse(ListAnimesResponse(listAnimes: [])));

    expect(
        bloc.mapEventToState(1),
        emitsInOrder([
          isA<AnimesLoading>(),
          isA<AnimesSucces>(),
        ]));
    bloc.add(0);
  });

  test('deve retornarum erro', () {
    when(() => usecase.call(any()))
        .thenAnswer((_) async => FailureResponse(NotValidCodeParam()));

    expect(
        bloc.mapEventToState(1),
        emitsInOrder([
          isA<AnimesLoading>(),
          isA<AnimesError>(),
        ]));
    bloc.add(0);
  });
}

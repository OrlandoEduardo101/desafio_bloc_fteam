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

void main() {
  late IGetListAnimes usecase;
  late GetAnimesListCubit cubit;

  setUpAll(() {
    usecase = UsecaseMock();
    cubit = GetAnimesListCubit(usecase);
    registerFallbackValue(GetAnimesListParam());
  });

  

  blocTest<GetAnimesListCubit, IAnimesState>(
      "must return states in the correct order",
      build: () {
        when(() => usecase.call(any())).thenAnswer(
            (_) async => SuccessResponse(ListAnimesResponse(listAnimes: [])));

        return cubit;
      },
      act: (cubit) => cubit.mapEventToState(),
      expect: () => [
          isA<AnimesLoading>(),
          isA<AnimesSucces>(),
      ]);

  blocTest<GetAnimesListCubit, IAnimesState>(
      "must return a error",
      build: () {
        when(() => usecase.call(any()))
        .thenAnswer((_) async => FailureResponse(NotValidCodeParam()));

        return GetAnimesListCubit(usecase);
      },
      act: (cubit) => cubit.mapEventToState(),
      expect: () => [
          isA<AnimesLoading>(),
          isA<AnimesError>(),
      ]);

  // test('must return states in the correct order', () {
  //   when(() => usecase.call(any())).thenAnswer(
  //       (_) async => SuccessResponse(ListAnimesResponse(listAnimes: [])));
  //   expect(
  //       cubit.stream,
  //       emitsInOrder([
  //         isA<AnimesLoading>(),
  //         isA<AnimesSucces>(),
  //       ]));
  //   //cubit.emit(AnimesSucces());
  // });

  // test( "must return a error", () {
  //   when(() => usecase.call(any()))
  //       .thenAnswer((_) async => FailureResponse(NotValidCodeParam()));

  //   expect(
  //       cubit.mapEventToState(),
  //       emitsInOrder([
  //         isA<AnimesLoading>(),
  //         isA<AnimesError>(),
  //       ]));
  // });
}

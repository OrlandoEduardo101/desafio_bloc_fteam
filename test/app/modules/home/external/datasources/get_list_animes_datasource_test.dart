import 'dart:convert';

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/external/datasources/get_list_animes_datasource.dart';
import 'package:desafio_bloc_fteam/app/modules/home/infra/datasources/i_get_list_animes_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../shared/jsons/jsons.dart';

class DioMock extends Mock implements Dio {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  late Dio dio;
  late IGetListAnimesDatasource datasource;
  late RequestOptionsMock requestOptionsMock;
  var param =  GetAnimesListParam();

  setUpAll(() async {
    dio = DioMock();
    datasource = GetListAnimesDatasource(dio);
    requestOptionsMock = RequestOptionsMock();
  });

  group('GetListAnimesdatasource', () {
    test('must return ListAnimesResponse', () async {
      when(() => dio.get(any()))
          .thenAnswer((_) async => Response(
                statusCode: 200,
                data: [jsonDecode(listAnimes)],
                requestOptions: requestOptionsMock,
              ));

      var result = await datasource.getListAnimes(param);

      expect(result, isA<ListAnimesResponse>());
    });

    test('must return HomeFormatterDatasourceError 401', () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: requestOptionsMock,
          error: 'Http status error [401]',
          response: Response(
            statusCode: 401,
            data: jsonDecode('''{
            "test": "test"
          }'''),
            requestOptions: requestOptionsMock,
          )));

      //var result = await datasource.getListAnimes(param);

      expect(() => datasource.getListAnimes(param),
          throwsA(isA<HomeFormatterDatasourceError>()));
    });

    test('must return HomeFormatterDatasourceError 400', () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: requestOptionsMock,
          error: 'Http status error [400]',
          response: Response(
            statusCode: 400,
            data: jsonDecode('''{
            "test": "test"
          }'''),
            requestOptions: requestOptionsMock,
          )));

      //var result = await datasource.getListAnimes(param);

      expect(() => datasource.getListAnimes(param),
          throwsA(isA<HomeFormatterDatasourceError>()));
    });

    test('must return HomeFormatterDatasourceError null', () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: requestOptionsMock,
          error: null,
          response: Response(
            statusCode: 401,
            data: jsonDecode('''{
            "test": "test"
          }'''),
            requestOptions: requestOptionsMock,
          )));

      //var result = await datasource.getListAnimes(param);

      expect(() => datasource.getListAnimes(param),
          throwsA(isA<HomeFormatterDatasourceError>()));
    });



    test('must return HomeFormatterDatasourceError 404', () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: requestOptionsMock,
          error: 'Http status error [404]',
          response: Response(
            statusCode: 404,
            data: jsonDecode('''{
            "test": "test"
          }'''),
            requestOptions: requestOptionsMock,
          )));

      //var result = await datasource.getListAnimes(param);

      expect(() => datasource.getListAnimes(param),
          throwsA(isA<HomeFormatterDatasourceError>()));
    });

    test('must return exception', () async {
      // ignore: lines_longer_than_80_chars
      when(() => dio.get(any()))
          .thenThrow(Exception());

      //var result = await datasouce.acceptTerm(true);

      expect(() => datasource.getListAnimes(param),
          throwsA(isA<Exception>()));
    });
  });
}



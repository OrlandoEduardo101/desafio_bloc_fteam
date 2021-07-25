import 'dart:convert';

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/content_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/external/formatters/response/content_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../shared/jsons/jsons.dart';

main() {
  var mapper = ContentFormatter();
  group('check keys', () {
    test('must check json without erros', () {
      expect(mapper.checkJson(jsonDecode(content)), completes);
    });

    test('must return MapperErrorActivityError', () {
      expect(mapper.checkJson({'tester': 'teste'}),
          throwsA(isA<MapperErrorActivityError>()));
    });
  });

  group('from map teste', () {
    test('must return assignmentsResponse without erros', () async {
      expect(mapper.fromMap(jsonDecode(content)), completes);
      expect(await mapper.fromMap(jsonDecode(content)),
          isA<ContentEntity>());
    });

    test('must return MapperErrorActivityError from error key', () async {
      var error = '';
      expect(mapper.fromMap({'tester': 'teste'}),
          throwsA(isA<MapperErrorActivityError>()));
      await mapper.fromMap({'tester': 'teste'}).catchError(
          // ignore: avoid_types_on_closure_parameters
          (e) async {
        error = e.message ?? '';
        return ContentEntity();
      });

      expect(error, equals('tester Não encontrada'));
    });

    test('must return MapperErrorActivityError from error type', () async {
      var error = '';
      expect(
          mapper.fromMap({
            'rendered': 0,
            'protected':false
          }),
          throwsA(isA<MapperErrorActivityError>()));

      await mapper
          .fromMap({'rendered': 0, 'protected':false}).catchError(
              // ignore: avoid_types_on_closure_parameters
              (e) async {
        error = e.message ?? '';
        return ContentEntity();
      });

      expect(error, equals('Erro de serialização'));
    });

    test('must return MapperErrorActivityError from null', () async {
      expect(mapper.fromMap({'criarOcorrenciaDocAction': null}),
          throwsA(isA<MapperErrorActivityError>()));
    });
  });

  group('to map test', () {
    test('must return a map', () {
      expect(
          mapper.toMap(ContentEntity(rendered: 'rendered', protected: true)), isA<Map>());
    });
  });
}


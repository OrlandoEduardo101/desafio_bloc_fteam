import 'dart:convert';

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/cury_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/home/external/mappers/response/cury_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../shared/jsons/jsons.dart';

main() {
  var mapper = CuryFormatter();
  group('check keys', () {
    test('must check json without erros', () {
      expect(mapper.checkJson(jsonDecode(cury)), completes);
    });

    test('must return MapperErrorActivityError', () {
      expect(mapper.checkJson({'tester': 'teste'}),
          throwsA(isA<MapperErrorActivityError>()));
    });
  });

  group('from map teste', () {
    test('must return assignmentsResponse without erros', () async {
      expect(mapper.fromMap(jsonDecode(cury)), completes);
      expect(await mapper.fromMap(jsonDecode(cury)),
          isA<CuryEntity>());
    });

    test('must return MapperErrorActivityError from error key', () async {
      var error = '';
      expect(mapper.fromMap({'tester': 'teste'}),
          throwsA(isA<MapperErrorActivityError>()));
      await mapper.fromMap({'tester': 'teste'}).catchError(
          // ignore: avoid_types_on_closure_parameters
          (e) async {
        error = e.message ?? '';
        return CuryEntity();
      });

      expect(error, equals('tester Não encontrada'));
    });

    test('must return MapperErrorActivityError from error type', () async {
      var error = '';
      expect(
          mapper.fromMap({
            'name': 0,
            'href': 0
          }),
          throwsA(isA<MapperErrorActivityError>()));

      await mapper
          .fromMap({'name': 0, 'href': 0}).catchError(
              // ignore: avoid_types_on_closure_parameters
              (e) async {
        error = e.message ?? '';
        return CuryEntity();
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
          mapper.toMap(CuryEntity(href: 'href', name: 'name', templated: true)), isA<Map>());
    });
  });
}


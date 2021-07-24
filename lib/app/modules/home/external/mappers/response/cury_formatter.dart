import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/cury_entity.dart';

import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';

class CuryFormatter extends IMapper<CuryEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['name', 'href', 'templated'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<CuryEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return CuryEntity(
        name: json['name'] == null ? null : json['name'],
        href: json['href'] == null ? null : json['href'],
        templated: json['templated'] == null ? null : json['templated'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        'name': object.name,
        'href': object.href,
        'templated': object.templated,
      };
      
}

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/guid_entity.dart';
import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';

class GuidFormatter extends IMapper<GuidEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['rendered'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<GuidEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return GuidEntity(
        rendered: json['rendered'] == null ? null : json['rendered'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "rendered": object.rendered,
      };
      
}

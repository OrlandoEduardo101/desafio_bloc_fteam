import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/entities/response/predecessor_version_entity.dart';
import '../../../domain/errors/errors/errors.dart';

class PredecessorVersionFormatter extends IMapper<PredecessorVersionEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['id', 'href'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<PredecessorVersionEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return PredecessorVersionEntity(
        id: json['id'] == null ? null : json['id'],
        href: json['href'] == null ? null : json['href'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "id": object.id,
        "href": object.href,
      };
      
}

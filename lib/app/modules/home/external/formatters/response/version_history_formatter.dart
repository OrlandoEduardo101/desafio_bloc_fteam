import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/entities/response/version_history_entity.dart';
import '../../../domain/errors/errors/errors.dart';

class VersionHistoryEntityFormatter extends IMapper<VersionHistoryEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['count', 'href'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<VersionHistoryEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return VersionHistoryEntity(
        count: json["count"] == null ? null : json["count"],
        href: json["href"] == null ? null : json["href"],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        'count': object.count,
        'href': object.href,
      };
}

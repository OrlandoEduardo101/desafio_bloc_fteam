import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/content_entity.dart';
import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';

class ContentFormatter extends IMapper<ContentEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['rendered', 'protected'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<ContentEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return ContentEntity(
        rendered: json['rendered'] == null ? null : json['rendered'],
        protected: json['protected'] == null ? null : json['protected'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        'rendered': object.rendered,
        'protected': object.protected,
      };
      
}

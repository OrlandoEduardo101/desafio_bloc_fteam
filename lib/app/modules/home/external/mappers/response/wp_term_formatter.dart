import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/wp_term_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/errors/errors/errors.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/contracts/i_mapper.dart';

class WpTermFormatter extends IMapper<WpTermEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['taxonomy', 'embeddable', 'href'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<WpTermEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return WpTermEntity(
        taxonomy: json['taxonomy'] == null ? null : json['taxonomy'],
        embeddable: json['embeddable'] == null ? null : json['embeddable'],
        href: json['href'] == null ? null : json['href'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        'taxonomy': object.taxonomy,
        'embeddable': object.embeddable,
        'href': object.href,
      };
}

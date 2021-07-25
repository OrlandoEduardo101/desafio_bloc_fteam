import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/author_entity.dart';
import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';

class AuthorFormatter extends IMapper<AuthorEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['href', 'embeddable'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<AuthorEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return AuthorEntity(
        embeddable: json['embeddable'] == null ? null : json['embeddable'],
        href: json['href'] == null ? null : json['href'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "embeddable": object.embeddable,
        "href": object.href,
      };
      
}

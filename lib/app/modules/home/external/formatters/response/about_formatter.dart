import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/about_entity.dart';
import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/errors/errors/errors.dart';

class AboutFormatter extends IMapper<AboutEntity> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['href'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<AboutEntity> fromMap(Map json) async {
    await checkJson(json);
    try {
      return AboutEntity(
        href: json['href'] == null ? null : json['href'],
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "href": object.href,
      };
      
}

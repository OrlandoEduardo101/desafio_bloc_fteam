import '../../../../shared/contracts/i_mapper.dart';
import '../../../domain/entities/response/list_animes_entity.dart';
import '../../../domain/entities/response/list_animes_response.dart';
import '../../../domain/errors/errors/errors.dart';
import 'list_animes_formatter.dart';

class ListAnimesResponseFormatter extends IMapper<ListAnimesResponse> {
  @override
  Future<void> checkJson(Map json) async {
    final jsonKeys = ['listAnimes'];

    for (var key in json.keys) {
      if (!jsonKeys.contains(key)) {
        throw MapperErrorActivityError(message: '$key Não encontrada');
      }
    }
  }

  @override
  Future<ListAnimesResponse> fromMap(Map json) async {
    await checkJson(json);
    try {
      final List<ListAnimesEntity> listAnimes = [];

      for (var item in json["listAnimes"] ?? []) {
        listAnimes.add(await ListAnimesFormatter().fromMap(item));
      }

      return ListAnimesResponse(
        listAnimes: listAnimes,
      );
    } catch (e) {
      throw MapperErrorActivityError(message: 'Erro de serialização');
    }
  }

  @override
  Map toMap(object) => {
        "listAnimes": object.listAnimes,
      };
}

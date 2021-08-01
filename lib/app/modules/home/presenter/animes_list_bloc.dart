import 'package:bloc/bloc.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_entity.dart';
import '../domain/entities/params/get_animes_list_param.dart';
import '../domain/usecases/get_list_animes.dart';
import 'states/animes_states.dart';

class GetAnimesListBloc extends Bloc<int, IAnimesState> {
  final IGetListAnimes _getListAnimes;

  GetAnimesListBloc(this._getListAnimes) : super(AnimesStart()) {
    //mapEventToState(1);
  }
  
  @override
  Stream<IAnimesState> mapEventToState(int page) async* {
    List<ListAnimesEntity> currentList = [];
    if (state is AnimesSucces) {
      currentList = (state as AnimesSucces).listAnimes;
    }

    yield AnimesLoading();
    final result = await _getListAnimes(GetAnimesListParam(page: page));
    yield result.fold(
        onFailure: (failure) {
          return AnimesError(failure);
        },
        onSuccess: (success) =>
            AnimesSucces(listAnimes: currentList + (success.listAnimes ?? [])));

    // if (state is AnimesError) {
    //   yield AnimesSucces(listAnimes: currentList);
    // }
  }
}

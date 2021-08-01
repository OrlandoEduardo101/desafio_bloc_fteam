import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/params/get_animes_list_param.dart';
import '../domain/entities/response/list_animes_entity.dart';
import '../domain/usecases/get_list_animes.dart';
import 'states/animes_states.dart';

class GetAnimesListCubit extends Cubit<IAnimesState> {
  GetAnimesListCubit(this._getListAnimes) : super(AnimesStart()) {
    //mapEventToState();
  }

  final IGetListAnimes _getListAnimes;

  int page = 1;

  Future<void> mapEventToState() async {
    List<ListAnimesEntity> currentList = [];
    if (state is AnimesSucces) {
      currentList = (state as AnimesSucces).listAnimes;
    }
    emit(AnimesLoading());
    final result = await _getListAnimes(GetAnimesListParam(page: page));

    result.fold(onFailure: (failure) {
      emit(AnimesError(failure));
      //emit(AnimesSucces(listAnimes: currentList));
    }, onSuccess: (success) {
      emit(AnimesSucces(listAnimes: currentList + (success.listAnimes ?? [])));
      page++;
    });
  }
}

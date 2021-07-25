import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/params/get_animes_list_param.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_response.dart';
import 'package:desafio_bloc_fteam/app/modules/home/domain/usecases/get_list_animes.dart';
import 'package:desafio_bloc_fteam/app/modules/home/presenter/states/animes_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAnimesListCubit extends Cubit<IAnimesState> {
  GetAnimesListCubit(this._getListAnimes) : super(AnimesStart()) {
    getListAnimes();
  }

  final IGetListAnimes _getListAnimes;

  int page = 1;

  Future<void> getListAnimes({List<ListAnimesEntity> currentList = const[]}) async {
    emit(AnimesLoading());
    final result = await _getListAnimes(GetAnimesListParam(page: page));

    result.fold(onFailure: (failure) {
      emit(AnimesError(failure));
    }, onSuccess: (success) {
      emit(AnimesSucces(ListAnimesResponse(listAnimes: currentList + (success.listAnimes??[]))));
      page++;
    });
  }
}

import 'package:desafio_bloc_fteam/app/modules/home/domain/entities/response/list_animes_entity.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/overlay/custom_overlay.dart';
import 'package:desafio_bloc_fteam/app/modules/shared/overlay/loading_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service_locator.dart';
import 'animes_list_cubit.dart';
import 'states/animes_states.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final GetAnimesListCubit controller = Modular.get();
  final ScrollController _scrollController = ScrollController();
  late GetAnimesListCubit controller;

  @override
  void initState() {
    super.initState();
    ServiceLocator.init();
    controller = getIt.get<GetAnimesListCubit>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // controller.getListAnimes();
      }
    });
  }

  @override
  void dispose() {
    controller.close();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animes List")),
      body: BlocBuilder<GetAnimesListCubit, IAnimesState>(
        bloc: controller,
        builder: (context, state) {
          if (state is AnimesError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Center(
              child: Text('${state.erro.message}'),
            )));
          }

          if (state is AnimesLoading) {
            LoadingDialogContent().show(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            LoadingDialogContent().hide();
          }

          final List<ListAnimesEntity>? list =  state is AnimesSucces ? state.listAnimes.listAnimes : [];
          return list!.isEmpty ? Container() : ListView.builder(
            itemCount: (list.length) + 1,
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == (list.length)) {
                controller.getListAnimes(currentList: list);
                return Container();
              }
              final ListAnimesEntity? anime = list[index];

              return ListTile(
                title: Text('${anime?.id}: ${anime?.title?.rendered}'),
                subtitle: Text('${anime?.guid?.rendered}'),
              );
            },
          );
        },
      ),
    );
  }
}

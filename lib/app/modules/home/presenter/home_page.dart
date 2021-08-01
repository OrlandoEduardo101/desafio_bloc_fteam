import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../shared/overlay/loading_dialog_content.dart';
import '../domain/entities/response/list_animes_entity.dart';
import '../service_locator.dart';
import 'animes_list_bloc.dart';
import 'states/animes_states.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final GetAnimesListCubit controller = Modular.get();
  final ScrollController _scrollController = ScrollController();
  late GetAnimesListBloc controller;
  List<ListAnimesEntity> listPage = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    ServiceLocator.init();
    controller = getIt.get<GetAnimesListBloc>();
    controller.add(page);

    ///controller.mapEventToState(page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.99) {
        page++;
        controller.add(page++);
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
      body: StreamBuilder<IAnimesState>(
        stream: controller.stream,
        builder: (context, snapshot) {
          final state = controller.state;

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

          final List<ListAnimesEntity>? list =
              state is AnimesSucces ? (state).listAnimes : listPage;
          listPage = list!;
          return listPage.isEmpty
              ? Container()
              : ListView.builder(
                  itemCount: (list.length),
                  controller: _scrollController,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final ListAnimesEntity? anime = list[index];

                    return ListTile(
                      title: Text('${anime?.id}: ${anime?.title?.rendered}'),
                      subtitle: Text('${anime?.guid?.rendered}'),
                      onTap: () {
                        asuka.showDialog(builder: (context) => Dialog(
                          child: Container(
                            child: SingleChildScrollView(child: Html(data: anime?.content?.rendered)),
                          ),
                        ));
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}

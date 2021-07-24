import 'list_animes_entity.dart';

class ListAnimesResponse {
    ListAnimesResponse({
        this.listAnimes,
    });

    final List<ListAnimesEntity>? listAnimes;

    ListAnimesResponse copyWith({
        List<ListAnimesEntity>? listAnimes,
    }) => 
        ListAnimesResponse(
            listAnimes: listAnimes ?? this.listAnimes,
        );

    factory ListAnimesResponse.fromJson(Map<String, dynamic> json) => ListAnimesResponse(
        
    );
}
class GetAnimesListParam {
  final int page;
  final int perPage;

  GetAnimesListParam({this.page = 1, this.perPage = 10});

  GetAnimesListParam copyWith({
    int? page,
    int? perPage,
  }) {
    return GetAnimesListParam(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }
}

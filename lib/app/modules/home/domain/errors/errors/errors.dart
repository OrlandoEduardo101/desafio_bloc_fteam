abstract class IHomeFormatterFailure implements Exception {
  final String? message;
  IHomeFormatterFailure({this.message});
}

class MapperErrorActivityError implements IHomeFormatterFailure {
  final String? message;
  MapperErrorActivityError({this.message});

  @override
  String toString() => 'IHomeFormatterFailure(message: $message)';


}

class NotValidCodeParam implements IHomeFormatterFailure {
  final String? message;
  NotValidCodeParam({this.message});

  @override
  String toString() => 'IHomeFormatterFailure(message: $message)';
}

class HomeFormatterDatasourceError implements IHomeFormatterFailure {
  final String? message;
  HomeFormatterDatasourceError({this.message});

  @override
  String toString() => 'HomeFormatterDatasourceError(message: $message)';
}

class HomeFormatterTypeError implements IHomeFormatterFailure {
  final String? message;
  HomeFormatterTypeError({this.message});

  @override
  String toString() => 'HomeFormatterTypeError(message: $message)';
}

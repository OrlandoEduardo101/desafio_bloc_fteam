abstract class IWpTermFormatterFailure implements Exception {
  final String? message;
  IWpTermFormatterFailure({this.message});
}

class MapperErrorActivityError implements IWpTermFormatterFailure {
  final String? message;
  MapperErrorActivityError({this.message});

  @override
  String toString() => 'IWpTermFormatterFailure(message: $message)';


}

class NotValidCodeParam implements IWpTermFormatterFailure {
  final String? message;
  NotValidCodeParam({this.message});

  @override
  String toString() => 'IWpTermFormatterFailure(message: $message)';
}

class WpTermFormatterDatasourceError implements IWpTermFormatterFailure {
  final String? message;
  WpTermFormatterDatasourceError({this.message});

  @override
  String toString() => 'WpTermFormatterDatasourceError(message: $message)';
}

class WpTermFormatterTypeError implements IWpTermFormatterFailure {
  final String? message;
  WpTermFormatterTypeError({this.message});

  @override
  String toString() => 'WpTermFormatterTypeError(message: $message)';
}

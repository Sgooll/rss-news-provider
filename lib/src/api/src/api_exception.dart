class ApiBaseException implements Exception {
  final String? msg;
  const ApiBaseException([this.msg]);

  @override
  String toString() => msg ?? 'ApiBaseException';
}

class RssNewsException extends ApiBaseException {
  @override
  const RssNewsException([String? msg]);

  @override
  String toString() => msg ?? 'RssNewsException';

}
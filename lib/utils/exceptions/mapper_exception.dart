class MapperException<From, To> implements Exception {
  final String message;

  const MapperException(this.message);

  @override
  String toString() {
    return 'Error when mapping class $From to $To: $message}';
  }
}
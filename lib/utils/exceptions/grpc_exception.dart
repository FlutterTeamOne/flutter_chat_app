class GrpcException implements Exception {
  final int statusCode;
  final String? message;

  const GrpcException({required this.statusCode, this.message});

  @override
  String toString() {
    return 'ConnectionException: statusCode: $statusCode, message: ${message ?? 'No message specified'}';
  }
}
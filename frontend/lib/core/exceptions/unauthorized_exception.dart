class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([
    this.message = "Session expired. Please login again.",
  ]);

  @override
  String toString() => message;
}
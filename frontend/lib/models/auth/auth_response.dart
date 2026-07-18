class AuthResponse {
  final String token;
  final String message;
  final String name;

  AuthResponse({
    required this.token,
    required this.message,
    required this.name,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
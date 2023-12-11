class AuthUserEntity {
  AuthUserEntity({
    required this.accessToken,
  });

  final String accessToken;

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) {
    return AuthUserEntity(accessToken: json['access_token'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
    };
  }
}

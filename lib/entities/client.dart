class ClientEntity {
  ClientEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.photo,
    required this.caption,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String photo;
  final String caption;

  factory ClientEntity.fromJson(Map<String, dynamic> json) {
    return ClientEntity(
      id: json['id'] ?? 0,
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      photo: json['photo'] ?? '',
      caption: json['caption'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'address': address,
      'photo': photo,
      'caption': caption,
    };
  }
}

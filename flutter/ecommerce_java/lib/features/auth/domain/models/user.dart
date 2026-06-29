class User {
  final String id;
  final String email;
  final String? name;
  final String? phoneNumber;
  final String? avatarUrl;
  final String? address;

  User({
    required this.id,
    required this.email,
    this.name,
    this.phoneNumber,
    this.avatarUrl,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
      'address': address,
    };
  }

  User copyWith({
    String? name,
    String? phoneNumber,
    String? avatarUrl,
    String? address,
  }) {
    return User(
      id: id,
      email: email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      address: address ?? this.address,
    );
  }
}

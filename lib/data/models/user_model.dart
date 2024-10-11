class UserModel {
  String userId;
  String fullName;
  String email;
  String phoneNumber;
  String passwordHash;
  UserRole role;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.passwordHash,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      passwordHash: json['password_hash'] as String,
      role: UserRoleExtension.fromString(json['role'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'password_hash': passwordHash,
      'role': role.value,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

enum UserRole {
  Customer,
  Fulfillment,
  Delivery,
  Admin,
}

extension UserRoleExtension on UserRole {
  String get value => this.toString().split('.').last;

  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (e) => e.toString().split('.').last == role,
      orElse: () =>
          UserRole.Customer, // Default to Customer if the role is not found
    );
  }
}

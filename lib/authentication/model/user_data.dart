class UserModel {
  final int id;
  final String name;
  final String email;
  final String phoneNo;
  final String role;
  final bool isVerified;
  final int creditPoint;
  final bool isProfileCompleted;
  final String discount;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.role,
    required this.isVerified,
    required this.creditPoint,
    required this.isProfileCompleted,
    required this.discount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNo: json['phoneNo'],
        role: json['role'],
        isVerified: json['isVerified'],
        creditPoint: json['creditPoint'],
        isProfileCompleted: json['isProfileCompleted'],
        discount: json['discount'],
      );
}
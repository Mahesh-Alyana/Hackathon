class LoginResponseModel {
  String? refresh;
  String? access;

  LoginResponseModel({this.refresh, this.access});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        refresh: json['refresh'],
        access: json['access'],
      );

  Map<String, dynamic> toJson() => {
        'refresh': refresh,
        'access': access,
      };
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

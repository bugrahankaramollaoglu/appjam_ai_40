import 'database_model.dart';

class UserModel extends DatabaseModel<UserModel>{

  int? userId;
  String? firstName;
  String? lastName;
  String? userName;
  int? age;
  String? location;
  String? email;
  String? password;

  UserModel(
      { this.password,
        this.userId,
        this.firstName,
        this.lastName,
        this.userName,
        this.age,
        this.location,
        this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    password= json['password'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    age = json['age'];
    location = json['location'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userName'] = this.userName;
    data['age'] = this.age;
    data['location'] = this.location;
    data['email'] = this.email;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

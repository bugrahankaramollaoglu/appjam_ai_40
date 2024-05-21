import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proje1/lib/user_model.dart';

class UserList{

  List<UserModel> userList = [
    UserModel(
      userId: 1,
      firstName: 'a',
      lastName: 'a',
      userName: 'johndoe123',
      age: 30,
      location: 'New York',
      email: 'john.doe@example.com',
      password: '1',
    ),
    UserModel(
      userId: 2,
      firstName: 'Alice',
      lastName: 'Smith',
      userName: 'asmith',
      age: 25,
      location: 'Los Angeles',
      email: 'alice.smith@example.com',
      password: 'secretword',
    ),
    UserModel(
      userId: 3,
      firstName: 'Emily',
      lastName: 'Johnson',
      userName: 'emilyj',
      age: 28,
      location: 'Chicago',
      email: 'emily.j@example.com',
      password: 'mypassword',
    ),
    UserModel(
      userId: 4,
      firstName: 'Michael',
      lastName: 'Brown',
      userName: 'mikebrown',
      age: 35,
      location: 'Houston',
      email: 'michael.brown@example.com',
      password: 'mypass123',
    ),
    UserModel(
      userId: 5,
      firstName: 'Sophia',
      lastName: 'Williams',
      userName: 'sophiaw',
      age: 27,
      location: 'Miami',
      email: 'sophia.w@example.com',
      password: 'password1234',
    ),
    UserModel(
      userId: 6,
      firstName: 'James',
      lastName: 'Jones',
      userName: 'jamesj',
      age: 32,
      location: 'Seattle',
      email: 'james.j@example.com',
      password: 'abc123',
    ),
    UserModel(
      userId: 7,
      firstName: 'Olivia',
      lastName: 'Taylor',
      userName: 'oliviat',
      age: 29,
      location: 'San Francisco',
      email: 'olivia.t@example.com',
      password: 'hello123',
    ),
    UserModel(
      userId: 8,
      firstName: 'William',
      lastName: 'Davis',
      userName: 'willd',
      age: 31,
      location: 'Boston',
      email: 'william.d@example.com',
      password: 'welcome123',
    ),
    UserModel(
      userId: 9,
      firstName: 'Emma',
      lastName: 'Martinez',
      userName: 'emartinez',
      age: 26,
      location: 'Dallas',
      email: 'emma.m@example.com',
      password: 'pass123',
    ),
    UserModel(
      userId: 10,
      firstName: 'Alexander',
      lastName: 'Garcia',
      userName: 'alexg',
      age: 33,
      location: 'Phoenix',
      email: 'alex.g@example.com',
      password: 'securepass',
    ),
  ];


  void addUser(UserModel user) {
    userList.add(user);
  }

  List<UserModel> getUsers() {
    return userList;
  }

  bool authenticateUser(String firstName, String lastName, String password) {
    // Kullanıcı adı ve şifreyi kontrol et
    return userList.any((user) =>
    user.firstName == firstName &&
        user.lastName == lastName &&
        user.password == password);
  }





}
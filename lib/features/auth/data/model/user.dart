import 'dart:convert';

import 'group.dart';

class UserConnexion {
  int id;
  String refresh;
  String access;
  String token;
  String email;
  String username;
  String password;
  String firstname;
  String lastname;
  String role;
  List<dynamic> groups;

  UserConnexion(
      // { this.id = 0, this.ide = 0,  this.token = '', this.email = '', this.password = '', this.firstname = '',this.lastname = ''});
      // { this.id, required this.ide,  required this.token , required this.email , required this.password, required this.firstname, required this.lastname});
      {required this.id,
      required this.refresh,
      required this.access,
      required this.token,
      required this.email,
      required this.username,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.role,
      required this.groups});

  factory UserConnexion.fromJson(Map<String, dynamic> json) {
    return UserConnexion(
      id: json['id'],
      refresh: json['refresh'],
      access: json['access'],
      token: json['token'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      role: json['role'],
      groups: json['groups']
          .map((dynamic item) => GroupConnexion.fromJson(item))
          .toList(),
    );
  }

  factory UserConnexion.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return UserConnexion(
      id: json['id'],
      refresh: json['refresh'],
      access: json['access'],
      token: json['token'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      role: json['role'],
      groups: json['groups']
          .map((dynamic item) => GroupConnexion.fromJson(item))
          .toList(),
    );
  }

  UserConnexion.fromMap(Map<String, dynamic> obj)
      : id = obj['id'],
        refresh = obj['refresh'],
        access = obj['access'],
        token = obj['token'],
        email = obj['email'],
        username = obj['username'],
        password = obj['password'],
        firstname = obj['firstname'],
        lastname = obj['lastname'],
        role = obj['role'],
        groups = obj['groups'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'username': username,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'role': role,
      'groups': groups,
    };
  }

  void printAttributes() {
    print("id: $id\n");
    print("token: $token\n");
    print("email: $email\n");
    print("username: $username\n");

    print("password: $password\n");
    print("firstname: $firstname\n");
    print("lastname: $lastname\n");
    print("role: $role\n");
    print("groups: $groups\n");
  }
}

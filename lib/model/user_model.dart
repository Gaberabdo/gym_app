import 'package:flutter/material.dart.';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? type;
  int? age;


  UserModel({this.name, this.email, this.phone, this.type, this.age,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    email = json!['email'] ?? '';
    name = json!['name']?? '';
    phone = json!['phone']?? '';
    type = json!['type']?? '';
    age = json!['age']?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'type': type,
      'age': age,


    };
  }
}

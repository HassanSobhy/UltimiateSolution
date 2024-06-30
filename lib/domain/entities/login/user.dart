
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;

  const User({
    this.name = '',
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
    );
  }

  @override
  List<Object?> get props => [name];

}
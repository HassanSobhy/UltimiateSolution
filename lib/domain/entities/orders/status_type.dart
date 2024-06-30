import 'package:equatable/equatable.dart';

class StatusType extends Equatable {
  final String name;
  final String number;

  const StatusType({
    this.name = '',
    this.number = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
    };
  }

  factory StatusType.fromMap(Map<String, dynamic> map) {
    return StatusType(
      name: map['name'],
      number: map['number'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        number,
      ];
}

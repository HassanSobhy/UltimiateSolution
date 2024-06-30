import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';

part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  @JsonKey(name: 'DeliveryName')
  final String? name;


  const RemoteUser({
    this.name = '',
  });


  factory RemoteUser.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserToJson(this);



}


extension RemoteUserExtension on RemoteUser {
  User mapToDomain() {
    return User(
      name: name ?? "",
    );
  }
}
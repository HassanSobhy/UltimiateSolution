import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_type.dart';

part 'remote_status_type.g.dart';

@JsonSerializable()
class RemoteStatusType {
  @JsonKey(name: 'TYP_NM')
  final String? name;
  @JsonKey(name: 'TYP_NO')
  final String? number;


  const RemoteStatusType({
    this.name = '',
    this.number = '',
  });


  factory RemoteStatusType.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatusTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatusTypeToJson(this);



}


extension RemoteStatusTypeExtension on RemoteStatusType {
  StatusType mapToDomain() {
    return StatusType(
      name: name ?? "",
      number: number ?? "",
    );
  }
}
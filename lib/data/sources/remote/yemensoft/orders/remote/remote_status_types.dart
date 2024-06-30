import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/orders/remote/remote_status_type.dart';
import 'package:ultimate_solutions_task/domain/entities/orders/status_types.dart';

part 'remote_status_types.g.dart';

@JsonSerializable()
class RemoteStatusTypes {
  @JsonKey(name: 'DeliveryStatusTypes')
  final List<RemoteStatusType>? statusTypes;


  const RemoteStatusTypes({
    this.statusTypes = const [],
  });


  factory RemoteStatusTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatusTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatusTypesToJson(this);



}


extension RemoteStatusTypesExtension on RemoteStatusTypes {
  StatusTypes mapToDomain() {
    return StatusTypes(
      statusTypes: statusTypes?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}
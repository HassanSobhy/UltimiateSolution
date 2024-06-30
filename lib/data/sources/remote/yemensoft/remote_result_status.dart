import 'package:json_annotation/json_annotation.dart';

part 'remote_result_status.g.dart';

@JsonSerializable()
class RemoteResultStatus {
  @JsonKey(name: 'ErrMsg')
  final String? message;
  @JsonKey(name: 'ErrNo')
  final int? errorNumber;

  RemoteResultStatus({
    this.message = "",
    this.errorNumber = 0,
  });


  factory RemoteResultStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteResultStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteResultStatusToJson(this);

}

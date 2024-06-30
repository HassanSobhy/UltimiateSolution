import 'package:json_annotation/json_annotation.dart';
import 'package:ultimate_solutions_task/data/sources/remote/yemensoft/remote_result_status.dart';


part 'yemen_soft_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class YemenSoftResponse<T> {
  @JsonKey(name: 'Data')
  T? data;
  @JsonKey(name: 'Result')
  RemoteResultStatus? result;

  YemenSoftResponse({
    this.data,
    this.result,
  });



  factory YemenSoftResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$YemenSoftResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$YemenSoftResponseToJson(this, (T) {
        return T;
      });
}




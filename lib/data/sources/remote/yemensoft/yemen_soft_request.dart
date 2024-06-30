import 'package:json_annotation/json_annotation.dart';


part 'yemen_soft_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class YemenSoftRequest<T> {
  @JsonKey(name: 'Value')
  T? value;

  YemenSoftRequest({
    this.value,
  });



  factory YemenSoftRequest.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$YemenSoftRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$YemenSoftRequestToJson(this, (T) {
        return T;
      });
}


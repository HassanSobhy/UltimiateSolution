import 'package:json_annotation/json_annotation.dart';

part 'status_request.g.dart';

@JsonSerializable()
class StatusRequest {
  @JsonKey(name: 'P_LANG_NO')
  final String language;

  const StatusRequest({
    required this.language,
  });



  factory StatusRequest.fromJson(Map<String, dynamic> json) =>
      _$StatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StatusRequestToJson(this);

  @override
  String toString() {
    return 'StatusRequest{language: $language,';
  }
}

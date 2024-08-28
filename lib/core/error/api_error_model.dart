import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel {
  String? message;
  String? status;
  String? detail;
  int? chatId;
  ApiErrorModel({this.message, this.status, this.chatId, this.detail});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

}
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/tasks/update")
  Future<String> getTasks({
    @Body() required Task body,
  });
}

@JsonSerializable()
class Task {
  Task({this.id, this.name, this.avatar, this.createdAt});

  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

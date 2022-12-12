import 'package:json_annotation/json_annotation.dart';

part 'list_user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  ListUserResponse();

  @JsonKey(name: "page")
  late int page;

  @JsonKey(name: "per_page")
  late int perPage;

  @JsonKey(name: "total")
  late int total;

  @JsonKey(name: "total_pages")
  late int totalPages;

  @JsonKey(name: "data")
  late List<User> users;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  late int id;

  @JsonKey(name: "email")
  late String email;

  @JsonKey(name: "first_name")
  late String firstName;

  @JsonKey(name: "last_name")
  late String lastName;

  @JsonKey(name: "avatar")
  late String avatar;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

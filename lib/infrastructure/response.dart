import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'response.jser.dart';

class User {
  final String id;
  final String email;
  @Alias('first_name')
  final String firstName;

  User(this.id, this.email, this.firstName);
}

class UserResponse {
  final List<User> data;

  UserResponse(this.data);
}

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {}

@GenSerializer()
class ResponseSerializer extends Serializer<UserResponse> with _$ResponseSerializer {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserSerializer implements Serializer<User> {
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'first_name', model.firstName);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = new User(
        map['id'] as String ?? getJserDefault('id'),
        map['email'] as String ?? getJserDefault('email'),
        map['first_name'] as String ?? getJserDefault('firstName'));
    return obj;
  }
}

abstract class _$ResponseSerializer implements Serializer<UserResponse> {
  Serializer<User> __userSerializer;
  Serializer<User> get _userSerializer =>
      __userSerializer ??= new UserSerializer();
  @override
  Map<String, dynamic> toMap(UserResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'data',
        codeIterable(model.data, (val) => _userSerializer.toMap(val as User)));
    return ret;
  }

  @override
  UserResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = new UserResponse(codeIterable<User>(map['data'] as Iterable,
            (val) => _userSerializer.fromMap(val as Map)) ??
        getJserDefault('data'));
    return obj;
  }
}

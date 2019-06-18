// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ApiClient implements ApiClient {
  final String basePath = "users";
  Future<UserResponse> loadParishList(int page) async {
    var req = base.get.path(basePath).query("page", page);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}

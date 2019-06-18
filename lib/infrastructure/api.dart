import 'package:flutter_playground/infrastructure/response.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';

part 'api.jretro.dart';

@GenApiClient(path: "users")
class Api extends ApiClient with _$ApiClient {
  final Route base;

  Api(this.base);

  @GetReq()
  Future<UserResponse> loadParishList(
    @QueryParam("per_page") int perPage,
  );
}



import 'package:chopper/chopper.dart';
import '../data/user.dart';
import 'headers.dart';

part 'users.chopper.dart';


@ChopperApi(baseUrl: "jsonapi.php/v1/users")
abstract class Users extends ChopperService {

  
  @Get(path: "/me", headers: apiHeaders)
  Future<Response<User?>> me();
  
  @Get(headers: apiHeaders)
  Future<Response<List<User>?>> all({
    @Query("page[offset]") int offset = 0,
    @Query("page[limit]") int limit = 100,
  });
  
  @Get(headers: apiHeaders)
  Future<Response<List<User>?>> search({
    @Query("page[offset]") int offset = 0,
    @Query("page[limit]") int limit = 100,
    @Query("filter[search]") String name,
  });

  @Get(path: "/{id}", headers: apiHeaders)
  Future<Response<User?>> get(@Path("id") String id);

  @Delete(path: "/{id}", headers: apiHeaders)
  Future<Response> delete(@Path("id") String id);
  
  
  
}




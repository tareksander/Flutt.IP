import 'package:chopper/chopper.dart';

part 'oauth.chopper.dart';

@ChopperApi(baseUrl: "dispatch.php/api")
abstract class OAuth extends ChopperService {
  
  @Post(path: "oauth/request_token")
  Future<Response<String>> requestToken1(@Header("Authorization") String auth);

  @Post(path: "oauth/access_token")
  Future<Response<String>> accessToken1(@Header("Authorization") String auth);


  @Post(path: "oauth2/token")
  Future<Response<String>> requestToken2(@Header("Authorization") String auth);

  @Get(path: "oauth2/authorize")
  Future<Response<String>> authorize2(@Header("Authorization") String auth);
  
}


import 'package:chopper/chopper.dart';
import 'headers.dart';

part 'discovery.chopper.dart';

@ChopperApi(baseUrl: "jsonapi.php/v1/discovery")
abstract class Discovery extends ChopperService {


  @Get(headers: apiHeaders)
  Future<Response<dynamic>> discovery();

}

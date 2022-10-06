import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:task/data/responses/property.dart';

import '../../app/constants.dart';

part 'api_app.g.dart';

/// It's a Dart class that extends the RestApi class from the dio_rest_api package. It has a factory
/// constructor that takes a Dio object and a baseUrl. 
@RestApi(
  baseUrl: Constants.baseUrl,
)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("properties/41")
  Future<PropertyResponse> getProperty();
}

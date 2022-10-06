

import 'package:task/data/responses/property.dart';

import '../network/api_app.dart';

abstract class RemoteDataSource {

  Future<PropertyResponse> getProperty( );
}

class RemoteDataSourceImpl implements RemoteDataSource {
 final  AppServiceClient _serviceClient;
  RemoteDataSourceImpl(
    this._serviceClient,
  );

  @override
  Future<PropertyResponse> getProperty() async{
  return await  _serviceClient.getProperty();
  }

}

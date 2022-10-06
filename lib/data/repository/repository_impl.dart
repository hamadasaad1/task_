import 'package:dartz/dartz.dart';
import 'package:task/data/mapper/mapper_response.dart';

import '../../domain/model/property_model.dart';
import '../../domain/repo/repository.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../remote_source/remote_data_source.dart';

/// > This class is responsible for calling the remote data source and returning the result to the
/// domain layer
class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, PropertyData>> getPropertyData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getProperty();


        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
   
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

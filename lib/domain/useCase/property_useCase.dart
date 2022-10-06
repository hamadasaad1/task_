import 'package:dartz/dartz.dart';
import 'package:task/domain/repo/repository.dart';

import '../../data/network/failure.dart';
import '../model/property_model.dart';
import 'base_usecase.dart';



class PropertyUseCase implements BaseUseCase<void, PropertyData> {
  final Repository _repository;
  PropertyUseCase(
    this._repository,
  );
  @override
  Future<Either<Failure, PropertyData>> execute(void input
      ) async {
    return await _repository.getPropertyData();
  }
}




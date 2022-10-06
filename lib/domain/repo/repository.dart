import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/property_model.dart';

abstract class Repository {


  Future<Either<Failure, PropertyData>> getPropertyData();
}

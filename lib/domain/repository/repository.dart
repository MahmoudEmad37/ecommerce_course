import 'package:advanced_ecommerce/data/network/failure.dart';
import 'package:advanced_ecommerce/data/network/requests.dart';
import 'package:advanced_ecommerce/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);

  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, HomeObject>> getHomeData();

  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
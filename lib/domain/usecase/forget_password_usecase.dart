
import 'package:advanced_ecommerce/data/network/failure.dart';
import 'package:advanced_ecommerce/domain/usecase/base_usecase.dart';
import 'package:advanced_ecommerce/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}
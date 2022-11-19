import 'package:dartz/dartz.dart';
import 'package:welcome_screen/domain/entity/role_entity.dart';

abstract class AuthUseCase<RegistrationParams, AuthParams>{
  Future <Either<String, RoleEnum>> signIn(AuthParams params);
  Future <String?> signUp(RegistrationParams params);
}
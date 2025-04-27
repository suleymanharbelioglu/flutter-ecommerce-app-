import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/model/user_creation_req.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

   @override
  Future<Either> signup(UserCreationReq user) async {
   return await sl<AuthFirebaseService>().signup(user);
  }
  @override
  Future<Either> getAges() async {
   return await sl<AuthFirebaseService>().getAges();
  }

 
}

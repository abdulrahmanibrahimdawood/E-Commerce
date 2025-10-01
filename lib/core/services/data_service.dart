import 'package:e_commerce/features/auth/domain/entites/user_entity.dart';

abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });
  Future<UserEntity> getUserDta({required String path, required String uId});
}

import 'package:auth_module/data/mappers/user_mapper.dart';
import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';
import 'package:shared_module/utils/typedefs.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SeekStorageDatasource localDatasource;

  const LoginRepositoryImpl({required this.localDatasource});

  @override
  ResultFuture<User?> getUser() async {
    try {
      final recentUser = await localDatasource.getUser();
      return Right(
        recentUser != null ? UserMapper.fromModel(recentUser) : null,
      );
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> logInUser(User user) async {
    try {
      final putUserResponse = await localDatasource.putUser(
        recentUserLocal: UserMapper.toModel(user),
      );
      return Right(putUserResponse);
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> setNewPin({required String newPin}) async {
    try {
      final recentUser = await localDatasource.getUser();

      final putUserResponse = await localDatasource.putUser(
        recentUserLocal:
            recentUser == null
                ? UserMapper.toModel(User.empty.copyWith(pin: newPin))
                : UserMapper.toModel(recentUser.copyWith(pin: newPin)),
      );
      return Right(putUserResponse);
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> validatePin({required String pin}) async {
    try {
      final recentUser = await localDatasource.getUser();
      return Right((recentUser?.pin  == pin) ? true : false);
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }
}

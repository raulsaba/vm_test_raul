import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:vm_test/app/core/errors/exceptions.dart';
import 'package:vm_test/app/core/errors/failures.dart';
import 'package:vm_test/app/features/exam/data/datasources/exam_datasource.dart';
import 'package:vm_test/app/features/exam/domain/repositories/exam_repository.dart';

@LazySingleton(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  final ExamDatasource _datasource;

  ExamRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, bool>> checkOrder(List<int> numbers) async {
    try {
      final result = await _datasource.checkOrder(numbers);
      return Right(result);
    } on ApiException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: e.message));
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: "Erro ao verificar a ordem"));
    }
  }

  @override
  Future<Either<Failure, List<int>>> getRandomNumbers(int quantity) async {
    try {
      final result = await _datasource.getRandomNumbers(quantity);
      return Right(result);
    } on ApiException catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: e.message));
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Left(Failure(message: "Erro ao gerar números aleatórios"));
    }
  }
}

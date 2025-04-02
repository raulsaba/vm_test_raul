import 'package:dartz/dartz.dart';
import 'package:vm_test/app/core/errors/failures.dart';

abstract class ExamRepository {
  Future<Either<Failure, List<int>>> getRandomNumbers(int quantity);
  Future<Either<Failure, bool>> checkOrder(List<int> numbers);
}

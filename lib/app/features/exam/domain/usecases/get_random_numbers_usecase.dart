import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vm_test/app/core/errors/failures.dart';
import 'package:vm_test/app/features/exam/domain/repositories/exam_repository.dart';

abstract class GetRandomNumbersUsecase {
  Future<Either<Failure, List<int>>> call(int quantity);
}

@LazySingleton(as: GetRandomNumbersUsecase)
class GetRandomNumbersUsecaseImpl implements GetRandomNumbersUsecase {
  final ExamRepository repository;

  GetRandomNumbersUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<int>>> call(int quantity) async {
    return await repository.getRandomNumbers(quantity);
  }
}

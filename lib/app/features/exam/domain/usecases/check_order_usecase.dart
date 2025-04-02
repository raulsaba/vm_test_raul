import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vm_test/app/core/errors/failures.dart';
import 'package:vm_test/app/features/exam/domain/repositories/exam_repository.dart';

abstract class CheckOrderUsecase {
  Future<Either<Failure, bool>> call(List<int> numbers);
}

@LazySingleton(as: CheckOrderUsecase)
class CheckOrderUsecaseImpl implements CheckOrderUsecase {
  final ExamRepository repository;

  CheckOrderUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(List<int> numbers) async {
    return await repository.checkOrder(numbers);
  }
}

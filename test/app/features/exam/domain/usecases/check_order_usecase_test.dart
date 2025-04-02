import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vm_test/app/features/exam/domain/usecases/check_order_usecase.dart';

import '../repositories/exam_repository_mock.mocks.dart';

void main() {
  late CheckOrderUsecaseImpl sut;
  late MockExamRepository mockExamRepository;

  setUp(() {
    mockExamRepository = MockExamRepository();
    sut = CheckOrderUsecaseImpl(mockExamRepository);
  });

  group('CheckOrderUsecaseImpl -', () {
    final tSortedList = [1, 2, 3, 4, 5];
    final tUnsortedList = [1, 2, 5, 3, 4];

    test("Deve fazer uma chamada para o repositório corretamente", () async {
      when(mockExamRepository.checkOrder(tSortedList)).thenAnswer((_) async => Right(true));
      await sut(tSortedList);
      verify(mockExamRepository.checkOrder(tSortedList)).called(1);
    });

    test('Deve retornar true quando a comunicação com o repositório ocorrer corretamente', () async {
      when(mockExamRepository.checkOrder(tSortedList)).thenAnswer((_) async => Right(true));
      final result = await sut(tSortedList);
      expect(result, Right(true));
    });

    test('Deve retornar false se a lista não estiver em ordem crescente', () async {
      when(mockExamRepository.checkOrder(tUnsortedList)).thenAnswer((_) async => Right(false));
      final result = await sut(tUnsortedList);
      expect(result, Right(false));
    });
  });
}

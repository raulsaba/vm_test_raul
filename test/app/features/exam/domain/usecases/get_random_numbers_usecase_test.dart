import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vm_test/app/core/errors/failures.dart';
import 'package:vm_test/app/features/exam/domain/usecases/get_random_numbers_usecase.dart';

import '../repositories/exam_repository_mock.mocks.dart';

void main() {
  late GetRandomNumbersUsecaseImpl sut;
  late MockExamRepository mockExamRepository;

  setUp(() {
    mockExamRepository = MockExamRepository();
    sut = GetRandomNumbersUsecaseImpl(mockExamRepository);
  });

  group('GetRandomNumbersUsecaseImpl -', () {
    final tResponse = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final tQuantity = 10;

    test("Deve fazer uma chamada para o repositório corretamente", () async {
      when(mockExamRepository.getRandomNumbers(any)).thenAnswer((_) async => Right(tResponse));
      await sut(tQuantity);
      verify(mockExamRepository.getRandomNumbers(tQuantity)).called(1);
    });

    test(
      'Deve retornar uma lista de números aleatórios quando a comunicação com o repositório ocorrer corretamente',
      () async {
        when(mockExamRepository.getRandomNumbers(tQuantity)).thenAnswer((_) async => Right(tResponse));
        final result = await sut(tQuantity);
        expect(result, Right(tResponse));
      },
    );

    test('Deve retornar uma falha se a resposta do repositório for uma falha', () async {
      when(
        mockExamRepository.getRandomNumbers(tQuantity),
      ).thenAnswer((_) async => Left(Failure(message: 'Erro ao gerar números aleatórios')));
      final result = await sut(tQuantity);
      expect(result, Left(Failure(message: 'Erro ao gerar números aleatórios')));
    });
  });
}

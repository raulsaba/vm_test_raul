import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vm_test/app/core/errors/failures.dart';
import 'package:vm_test/app/features/exam/data/datasources/exam_datasource.dart';
import 'package:vm_test/app/features/exam/data/repsoitories/exam_repository_impl.dart';

import 'exam_repository_impl_test.mocks.dart';

@GenerateMocks([ExamDatasource])
void main() {
  late ExamRepositoryImpl sut;
  late MockExamDatasource mockExamDatasource;

  setUp(() {
    mockExamDatasource = MockExamDatasource();
    sut = ExamRepositoryImpl(mockExamDatasource);
  });

  group('ExamRepositoryImpl -', () {
    group('getRandomNumbers -', () {
      final tResponse = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      final tQuantity = 10;
      test("Deve realizar uma chamada para o método getRandomNumbers do ExamDatasource", () async {
        when(mockExamDatasource.getRandomNumbers(tQuantity)).thenAnswer((_) async => tResponse);
        await sut.getRandomNumbers(tQuantity);
        verify(mockExamDatasource.getRandomNumbers(tQuantity)).called(1);
      });
      test(
        'Deve retornar uma lista de números aleatórios quando a comunicação com a API ocorrer corretamente',
        () async {
          when(mockExamDatasource.getRandomNumbers(tQuantity)).thenAnswer((_) async => tResponse);
          final result = await sut.getRandomNumbers(tQuantity);
          expect(result, Right(tResponse));
        },
      );

      test('Deve retornar uma falha se a resposne da API for uma Exception', () async {
        when(mockExamDatasource.getRandomNumbers(0)).thenThrow(Exception('Erro ao gerar números aleatórios'));
        final result = await sut.getRandomNumbers(0);
        verify(mockExamDatasource.getRandomNumbers(0));
        expect(result, equals(Left(Failure(message: 'Erro ao gerar números aleatórios'))));
      });
    });
    group('checkOrder -', () {
      final tSortedList = [1, 2, 3, 4, 5];
      final tUnsortedList = [1, 2, 5, 3, 4];
      test("Deve realizar uma chamada para o método checkOrder do ExamDatasource", () async {
        when(mockExamDatasource.checkOrder(tSortedList)).thenAnswer((_) async => true);
        await sut.checkOrder(tSortedList);
        verify(mockExamDatasource.checkOrder(tSortedList)).called(1);
      });

      test('Deve retornar true quando a comunicação com a API ocorrer corretamente', () async {
        when(mockExamDatasource.checkOrder(tSortedList)).thenAnswer((_) async => true);
        final result = await sut.checkOrder(tSortedList);
        expect(result, Right(true));
      });

      test('Deve retornar false se a lista não estiver em ordem crescente', () async {
        when(mockExamDatasource.checkOrder(tUnsortedList)).thenAnswer((_) async => false);
        final result = await sut.checkOrder(tUnsortedList);
        expect(result, Right(false));
      });

      test('Deve retornar uma falha se a resposne da API for uma Exception', () async {
        when(mockExamDatasource.checkOrder(tUnsortedList)).thenThrow(Exception('Erro ao verificar a ordem'));
        final result = await sut.checkOrder(tUnsortedList);
        verify(mockExamDatasource.checkOrder(tUnsortedList));
        expect(result, equals(Left(Failure(message: 'Erro ao verificar a ordem'))));
      });
    });
  });
}

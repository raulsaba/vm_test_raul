import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vm_test/app/core/api/exam_api.dart';
import 'package:vm_test/app/core/errors/exceptions.dart';
import 'package:vm_test/app/features/exam/data/datasources/exam_datasource.dart';

import 'exam_datasource_test.mocks.dart';

@GenerateMocks([ExamApi])
void main() {
  late ExamDatasourceImpl sut;
  late MockExamApi mockExamApi;

  setUp(() {
    mockExamApi = MockExamApi();
    sut = ExamDatasourceImpl(mockExamApi);
  });

  group('ExamDatasourceImpl -', () {
    group('getRandomNumbers -', () {
      final tApiResposne = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      final tQuantity = 10;
      test("Deve realizar uma chamada para o método getRandomNumbers do ExamApi", () async {
        when(mockExamApi.getRandomNumbers(tQuantity)).thenAnswer((_) => tApiResposne);
        await sut.getRandomNumbers(tQuantity);
        verify(mockExamApi.getRandomNumbers(tQuantity)).called(1);
      });
      test(
        'Deve retornar uma lista de números aleatórios quando a comunicação com a API ocorrer corretamente',
        () async {
          when(mockExamApi.getRandomNumbers(tQuantity)).thenAnswer((_) => tApiResposne);
          final result = await sut.getRandomNumbers(tQuantity);
          expect(result, tApiResposne);
        },
      );

      test('Deve lançar uma exceção se a resposne da API for uma Exception', () {
        when(mockExamApi.getRandomNumbers(0)).thenThrow(ApiException('Quantidade inválida'));
        expect(() => sut.getRandomNumbers(0), throwsA(isA<ApiException>()));
      });
    });
    group('checkOrder -', () {
      final tSortedList = [1, 2, 3, 4, 5];
      final tUnsortedList = [1, 2, 5, 3, 4];
      test("Deve realizar uma chamada para o método checkOrder do ExamApi", () async {
        when(mockExamApi.checkOrder(tSortedList)).thenAnswer((_) => true);
        await sut.checkOrder(tSortedList);
        verify(mockExamApi.checkOrder(tSortedList)).called(1);
      });

      test('Deve retornar true quando a comunicação com a API ocorrer corretamente', () async {
        when(mockExamApi.checkOrder(tSortedList)).thenAnswer((_) => true);
        final result = await sut.checkOrder(tSortedList);
        expect(result, true);
      });

      test('Deve retornar false se a lista não estiver em ordem crescente', () async {
        when(mockExamApi.checkOrder(tUnsortedList)).thenAnswer((_) => false);
        final result = await sut.checkOrder(tUnsortedList);
        expect(result, false);
      });

      test('Deve lançar uma exceção se a resposne da API for uma Exception', () {
        when(mockExamApi.checkOrder(tSortedList)).thenThrow(ApiException('Erro ao verificar a ordem'));
        expect(() => sut.checkOrder(tSortedList), throwsA(isA<ApiException>()));
      });
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:vm_test/app/core/api/exam_api.dart';

void main() {
  late ExamApiImpl sut;

  setUp(() {
    sut = ExamApiImpl();
  });

  group('ExamApiImpl -', () {
    group('getRandomNumbers -', () {
      test('Deve retornar uma lista de números aleatórios', () {
        final result = sut.getRandomNumbers(10);
        expect(result.length, 10);
        expect(result.toSet().length, 10);
      });

      test("O tamanho da lista deve ser igual a quantidade solicitada", () {
        final result = sut.getRandomNumbers(5);
        expect(result.length, 5);
      });

      test('Deve lançar uma exceção se a quantidade for menor que 1', () {
        expect(() => sut.getRandomNumbers(0), throwsA(isA<Exception>()));
      });
      test('Não deve retornar números repetidos', () {
        final result = sut.getRandomNumbers(100);
        final uniqueNumbers = result.toSet();
        expect(uniqueNumbers.length, 100);
      });
    });
    group('checkOrder -', () {
      test('Deve retornar true se a lista estiver em ordem crescente', () {
        final result = sut.checkOrder([1, 2, 3, 4, 5]);
        expect(result, true);
      });

      test('Deve retornar false se a lista não estiver em ordem crescente', () {
        final result = sut.checkOrder([5, 4, 3, 2, 1]);
        expect(result, false);
      });

      test('Deve retornar true se a lista estiver vazia', () {
        final result = sut.checkOrder([]);
        expect(result, true);
      });

      test("Deve retornar true se a lista tiver apenas um elemento", () {
        final result = sut.checkOrder([1]);
        expect(result, true);
      });

      test("Deve retornar false se a lista tiver apenas um elemento não ordenado", () {
        final result = sut.checkOrder([1, 2, 5, 3, 4]);
        expect(result, false);
      });
    });
  });
}

import 'dart:math';

import 'package:injectable/injectable.dart';

abstract class ExamApi {
  // Retorna uma lista de números aleatórios com
  // a quantidade de itens solicitada
  // não pode repetir números
  List<int> getRandomNumbers(int quantity);
  // Verifica se uma lista de números informada
  // está em ordem crescente e retorna o resultado
  bool checkOrder(List<int> numbers);
}

@LazySingleton(as: ExamApi)
class ExamApiImpl implements ExamApi {
  @override
  List<int> getRandomNumbers(int quantity) {
    if (quantity < 1) {
      throw 'A quantidade deve ser maior que 0';
    }
    final random = Random();
    final numbers = <int>{};
    while (numbers.length < quantity) {
      numbers.add(random.nextInt(10000));
    }
    return numbers.toList();
  }

  @override
  bool checkOrder(List<int> numbers) {
    if (numbers.isEmpty) {
      throw 'A lista não pode estar vazia';
    }
    for (int i = 0; i < numbers.length - 1; i++) {
      if (numbers[i] > numbers[i + 1]) {
        return false;
      }
    }
    return true;
  }
}

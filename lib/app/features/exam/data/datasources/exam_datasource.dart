import 'package:injectable/injectable.dart';
import 'package:vm_test/app/core/api/exam_api.dart';
import 'package:vm_test/app/core/errors/exceptions.dart';

abstract class ExamDatasource {
  Future<List<int>> getRandomNumbers(int quantity);
  Future<bool> checkOrder(List<int> numbers);
}

@LazySingleton(as: ExamDatasource)
class ExamDatasourceImpl implements ExamDatasource {
  final ExamApi _api;

  ExamDatasourceImpl(this._api);

  @override
  Future<List<int>> getRandomNumbers(int quantity) async {
    try {
      return _api.getRandomNumbers(quantity);
    } catch (e) {
      throw ApiException('Erro ao obter números aleatórios: $e');
    }
  }

  @override
  Future<bool> checkOrder(List<int> numbers) async {
    try {
      return _api.checkOrder(numbers);
    } catch (e) {
      throw ApiException('Erro ao verificar a ordem: $e');
    }
  }
}

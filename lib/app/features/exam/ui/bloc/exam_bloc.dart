import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:vm_test/app/features/exam/domain/usecases/check_order_usecase.dart';
import 'package:vm_test/app/features/exam/domain/usecases/get_random_numbers_usecase.dart';

part 'exam_event.dart';
part 'exam_state.dart';

@injectable
class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc(this._checkOrderUsecase, this._getRandomNumbersUsecase) : super(ExamInitial()) {
    on<GetRandomNumbersEvent>((event, emit) async {
      emit(ExamLoading(numbers: state.numbers));
      final result = await _getRandomNumbersUsecase.call(event.quantity);
      result.fold(
        (failure) => emit(ExamError(numbers: state.numbers, errorMessage: failure.message)),
        (numbers) => emit(ExamLoaded(numbers: numbers)),
      );
    });
    on<CheckOrderEvent>((event, emit) async {
      emit(ExamLoading(numbers: state.numbers));
      final result = await _checkOrderUsecase.call(event.numbers);
      result.fold(
        (failure) => emit(ExamError(numbers: state.numbers, errorMessage: failure.message)),
        (isOrdered) => emit(ExamChecked(numbers: state.numbers, isOrdered: isOrdered)),
      );
    });

    on<ResetBloc>((event, emit) async {
      emit(ExamInitial());
    });

    on<ReorderListEvent>((event, emit) async {
      emit(ExamLoading(numbers: state.numbers));
      if (event.oldIndex < event.newIndex) {
        final newList = List.of(state.numbers);
        final item = newList.removeAt(event.oldIndex);
        newList.insert(event.newIndex - 1, item);
        emit(ExamLoaded(numbers: newList));
      } else {
        final newList = List.of(state.numbers);
        final item = newList.removeAt(event.oldIndex);
        newList.insert(event.newIndex, item);
        emit(ExamLoaded(numbers: newList));
      }
    });
  }

  final GetRandomNumbersUsecase _getRandomNumbersUsecase;
  final CheckOrderUsecase _checkOrderUsecase;
}

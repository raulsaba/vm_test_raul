part of 'exam_bloc.dart';

sealed class ExamEvent extends Equatable {
  const ExamEvent();

  @override
  List<Object> get props => [];
}

class GetRandomNumbersEvent extends ExamEvent {
  const GetRandomNumbersEvent({required this.quantity});

  final int quantity;

  @override
  List<Object> get props => [quantity];
}

class CheckOrderEvent extends ExamEvent {
  const CheckOrderEvent({required this.numbers});

  final List<int> numbers;

  @override
  List<Object> get props => [numbers];
}

class ResetBloc extends ExamEvent {
  const ResetBloc();
}

class ReorderListEvent extends ExamEvent {
  const ReorderListEvent({required this.oldIndex, required this.newIndex});

  final int oldIndex;
  final int newIndex;

  @override
  List<Object> get props => [oldIndex, newIndex];
}

part of 'exam_bloc.dart';

sealed class ExamState extends Equatable {
  const ExamState({required this.numbers});

  final List<int> numbers;

  @override
  List<Object> get props => [numbers];
}

final class ExamInitial extends ExamState {
  const ExamInitial({super.numbers = const []});
}

final class ExamLoading extends ExamState {
  const ExamLoading({required super.numbers});
}

final class ExamLoaded extends ExamState {
  const ExamLoaded({required super.numbers});
}

final class ExamChecked extends ExamState {
  const ExamChecked({required super.numbers, required this.isOrdered});
  final bool isOrdered;
}

final class ExamError extends ExamState {
  const ExamError({required super.numbers, required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [numbers, errorMessage];
}

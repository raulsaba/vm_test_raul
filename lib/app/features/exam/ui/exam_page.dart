import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vm_test/app/features/exam/ui/bloc/exam_bloc.dart';
import 'package:vm_test/app/features/exam/ui/components/quantity_dialog.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamBloc, ExamState>(
      listener: (context, state) {
        switch (state) {
          case ExamError():
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            break;
          case ExamChecked():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.isOrdered ? 'A lista está ordenada' : 'A lista não está ordenada',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: state.isOrdered ? const Color(0xFF155817) : const Color(0xFF641813),
                  ),
                ),
                backgroundColor: state.isOrdered ? const Color(0xFF8CE08F) : const Color(0xFFDA8079),
              ),
            );
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exam Page'),
          actions: [
            IconButton(
              tooltip: 'Reiniciar números',
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<ExamBloc>().add(ResetBloc());
              },
            ),
            IconButton(
              tooltip: 'Gerar Lista',
              icon: const Icon(Icons.add),
              onPressed: () {
                QuantityDialog.show(context).then((value) {
                  if (value != null && context.mounted) {
                    context.read<ExamBloc>().add(GetRandomNumbersEvent(quantity: value));
                  }
                });
              },
            ),
          ],
        ),
        body: BlocBuilder<ExamBloc, ExamState>(
          builder: (context, state) {
            List<int> numbers = state.numbers;
            if (numbers.isEmpty) {
              return const Center(child: Text('Pressione o botão com o símbolo de "+" para gerar números aleatórios'));
            }
            return ReorderableListView.builder(
              onReorder: (oldIndex, newIndex) {
                context.read<ExamBloc>().add(ReorderListEvent(oldIndex: oldIndex, newIndex: newIndex));
              },
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return ReorderableDragStartListener(
                  enabled: state is! ExamLoading,
                  key: UniqueKey(),
                  index: index,
                  child: ListTile(
                    title: Text(numbers[index].toString()),
                    key: UniqueKey(),
                    trailing: Icon(Icons.drag_handle),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: BlocSelector<ExamBloc, ExamState, List<int>>(
          selector: (state) => state.numbers,
          builder: (context, numbers) {
            return FloatingActionButton(
              onPressed: () {
                context.read<ExamBloc>().add(CheckOrderEvent(numbers: numbers));
              },
              child: const Icon(Icons.check_circle_outline),
            );
          },
        ),
      ),
    );
  }
}

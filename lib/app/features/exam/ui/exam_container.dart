import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vm_test/app/core/get_it/get_it_config.dart';
import 'package:vm_test/app/features/exam/ui/bloc/exam_bloc.dart';
import 'package:vm_test/app/features/exam/ui/exam_page.dart';

class ExamContainer extends StatelessWidget {
  const ExamContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt.get<ExamBloc>(), child: ExamPage());
  }
}

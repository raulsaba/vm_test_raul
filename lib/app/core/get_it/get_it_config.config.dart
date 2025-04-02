// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:vm_test/app/core/api/exam_api.dart' as _i473;
import 'package:vm_test/app/features/exam/data/datasources/exam_datasource.dart'
    as _i989;
import 'package:vm_test/app/features/exam/data/repsoitories/exam_repository_impl.dart'
    as _i489;
import 'package:vm_test/app/features/exam/domain/repositories/exam_repository.dart'
    as _i125;
import 'package:vm_test/app/features/exam/domain/usecases/check_order_usecase.dart'
    as _i782;
import 'package:vm_test/app/features/exam/domain/usecases/get_random_numbers_usecase.dart'
    as _i287;
import 'package:vm_test/app/features/exam/ui/bloc/exam_bloc.dart' as _i512;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i473.ExamApi>(() => _i473.ExamApiImpl());
    gh.lazySingleton<_i989.ExamDatasource>(
      () => _i989.ExamDatasourceImpl(gh<_i473.ExamApi>()),
    );
    gh.lazySingleton<_i125.ExamRepository>(
      () => _i489.ExamRepositoryImpl(gh<_i989.ExamDatasource>()),
    );
    gh.lazySingleton<_i782.CheckOrderUsecase>(
      () => _i782.CheckOrderUsecaseImpl(gh<_i125.ExamRepository>()),
    );
    gh.lazySingleton<_i287.GetRandomNumbersUsecase>(
      () => _i287.GetRandomNumbersUsecaseImpl(gh<_i125.ExamRepository>()),
    );
    gh.factory<_i512.ExamBloc>(
      () => _i512.ExamBloc(
        gh<_i782.CheckOrderUsecase>(),
        gh<_i287.GetRandomNumbersUsecase>(),
      ),
    );
    return this;
  }
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vm_test/app/core/get_it/get_it_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
configureDependencies() async => getIt.init();

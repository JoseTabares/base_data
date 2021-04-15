import 'package:base_domain/save_use_case.dart';

import 'api_source.dart';

mixin SaveRepositoryAdapter<T, R> implements SaveRepository<T, R> {
  ApiSource get apiSource;

  @override
  Future<T> save(R request, [Map args]) {
    return (apiSource as PostApiSource).post(request, args);
  }
}

import 'package:base_domain/update_use_case.dart';

import 'api_source.dart';

mixin UpdateRepositoryAdapter<T, R> implements UpdateRepository<T, R> {
  ApiSource get apiSource;

  @override
  Future<T> update(R request, [Map args]) {
    return (apiSource as PutApiSource).put(request, args);
  }
}

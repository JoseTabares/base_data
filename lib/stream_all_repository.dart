import 'package:base_domain/stream_all_use_case.dart';

import 'db_source.dart';

mixin StorageStreamAllRepositoryAdapter<T> implements StreamAllRepository<T> {
  DbSource get dbSource;

  @override
  Stream<List<T>> streamAll([Map args]) {
    return (dbSource as StreamAllDbSource).streamAll(args);
  }
}

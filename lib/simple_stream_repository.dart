import 'package:base_domain/simple_stream_use_case.dart';

import 'db_source.dart';

mixin StorageSimpleStreamRepositoryAdapter<T>
    implements SimpleStreamRepository<T> {
  DbSource get dbSource;

  @override
  Stream<T> stream([Map args]) {
    return (dbSource as SimpleStreamDbSource<T>).stream(args);
  }
}

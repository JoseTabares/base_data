import 'package:base_domain/stream_by_id_use_case.dart';

import 'db_source.dart';

mixin StorageStreamByIdRepositoryAdapter<T> implements StreamByIdRepository<T> {
  DbSource get dbSource;

  @override
  Stream<T?> streamById(String? id, [Map? args]) {
    return (dbSource as StreamByIdDbSource).streamById(id, args) as Stream<T>;
  }
}

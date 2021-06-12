import 'package:base_domain/delete_by_id_use_case.dart';

import 'api_source.dart';
import 'db_source.dart';

mixin StorageDeleteByIdRepositoryAdapter<T> implements DeleteByIdRepository<T> {
  ApiSource get apiSource;
  DbSource get dbSource;

  @override
  Future<T?> delete(String? id, [Map? args]) {
    return (apiSource as DeleteByIdApiSource<T>)
        .delete(id, args)
        .then((result) async {
      await (dbSource as DeleteByIdDbSource<T>).deleteById(id, args);
      return result;
    });
  }
}

mixin DeleteByIdRepositoryAdapter<T> implements DeleteByIdRepository<T> {
  ApiSource get apiSource;

  @override
  Future<T?> delete(String? id, [Map? args]) {
    return (apiSource as DeleteByIdApiSource<T>).delete(id, args);
  }
}

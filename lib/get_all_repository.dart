import 'package:base_domain/get_all_use_case.dart';
import 'package:base_models/base_model.dart';

import 'api_source.dart';
import 'db_source.dart';

mixin StorageGetAllRepositoryAdapter<T extends BaseModel>
    implements GetAllRepository<T> {
  ApiSource get apiSource;

  DbSource get dbSource;

  @override
  Future<List<T>?> getAll([Map? args]) {
    return (apiSource as GetAllApiSource<T>).getAll(args).then((result) async {
      await (dbSource as PutAllDbSource<T>).putAll(result, args: args);
      return result;
    });
  }
}

mixin GetAllRepositoryAdapter<T> implements GetAllRepository<T> {
  ApiSource get apiSource;

  @override
  Future<List<T>?> getAll([Map? args]) {
    return (apiSource as GetAllApiSource<T>).getAll(args);
  }
}

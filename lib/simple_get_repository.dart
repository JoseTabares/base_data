import 'package:base_domain/simple_get_use_case.dart';
import 'package:base_models/base_model.dart';

import 'api_source.dart';
import 'db_source.dart';

mixin StorageSimpleGetRepositoryAdapter<T extends BaseModel>
    implements SimpleGetRepository<T> {
  ApiSource get apiSource;

  DbSource get dbSource;

  @override
  Future<T?> get([Map? args]) {
    return (apiSource as GetApiSource<T>).get(args).then((result) async {
      if (result != null) {
        await (dbSource as SimplePutDbSource<T>).put(result, args);
      }
      return result;
    });
  }
}

mixin SimpleGetRepositoryAdapter<T> implements SimpleGetRepository<T> {
  ApiSource get apiSource;

  @override
  Future<T?> get([Map? args]) {
    return (apiSource as GetApiSource).get(args).then((value) => value as T);
  }
}

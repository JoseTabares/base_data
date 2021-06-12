import 'package:base_domain/get_by_id_use_case.dart';
import 'package:base_models/base_model.dart';

import 'api_source.dart';
import 'db_source.dart';

mixin StorageGetByIdRepositoryAdapter<T extends BaseModel>
    implements GetByIdRepository<T> {
  ApiSource get apiSource;

  DbSource get dbSource;

  @override
  Future<T?> getById(String? id, [Map? args]) {
    return (apiSource as GetByIdApiSource<T>)
        .getById(id, args)
        .then((result) async {
      if (result != null) {
        await (dbSource as PutDbSource<T>).put(result, args);
      }
      return result;
    });
  }
}

mixin GetByRepositoryIdAdapter<T> implements GetByIdRepository<T> {
  ApiSource get apiSource;

  @override
  Future<T?> getById(String? id, [Map? args]) {
    return (apiSource as GetByIdApiSource<T>).getById(id, args);
  }
}

import 'package:base_domain/save_in_storage_use_case.dart';
import 'package:base_models/base_model.dart';

import 'db_source.dart';

mixin SaveInStorageRepositoryAdapter<T extends BaseModel>
    implements SaveInStorageRepository<T> {
  DbSource get dbSource;

  @override
  Future saveInStorage(T? request, [Map? args]) {
    return (dbSource as PutDbSource).put(request, args);
  }
}

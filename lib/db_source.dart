import 'package:base_models/base_model.dart';

mixin DbSource {}

mixin PutAllDbSource<T extends BaseModel> on DbSource {
  Future putAll(
    List<T>? items, {
    bool delete = true,
    Map? args,
  });
}

mixin PutDbSource<T extends BaseModel?> on DbSource {
  Future put(T? item, [Map? args]);
}

mixin StreamAllDbSource<T> on DbSource {
  Stream<List<T>?> streamAll([Map? args]);
}

mixin StreamByIdDbSource<T> on DbSource {
  Stream<T?> streamById(String? id, [Map? args]);
}

mixin DeleteByIdDbSource<T> on DbSource {
  Future deleteById(String? id, [Map? args]);
}

mixin SimplePutDbSource<T extends BaseModel> on DbSource {
  Future put(T? item, [Map? args]);
}

mixin SimpleStreamDbSource<T> on DbSource {
  Stream<T?> stream([Map? args]);
}

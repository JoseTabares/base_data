Library for manage general repositories.

## Using

For use repositories with api implementations

```dart

import 'package:base_data/base_data.dart';

mixin UsersApiSource on GetAllApiSource<User> {}

class UsersRepositoryAdapter with GetAllRepositoryAdapter<User> {
  final UsersApiSource apiSource;

  UsersRepositoryAdapter(this.apiSource);
}

```

For use repositories with api and db implementations

```dart

import 'package:base_data/base_data.dart';

mixin UsersApiSource on GetAllApiSource<User> {}

mixin UsersDbSource on PutAllDbSource<User> {}

class UsersRepositoryAdapter with StorageGetAllRepositoryAdapter<User> {
  final UsersApiSource apiSource;
  final UsersDbSource dbSource;

  UsersRepositoryAdapter(
    this.apiSource,
    this.dbSource,
  );
}


```


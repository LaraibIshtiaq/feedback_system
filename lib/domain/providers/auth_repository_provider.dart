import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

///This will contain provider for respective Repo.
Provider<AuthRepository> authProviderRepository = Provider<AuthRepository>(
  (ref) {
    return AuthRepositoryImpl();
  },
);
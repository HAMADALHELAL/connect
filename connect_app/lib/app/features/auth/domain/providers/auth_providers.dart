import 'package:connect_app/app/features/auth/domain/providers/controller/auth_controller.dart';
import 'package:connect_app/app/features/auth/domain/providers/controller/text_form_provider.dart';
import 'package:connect_app/app/features/auth/domain/providers/state/auth_state.dart';
import 'package:connect_app/app/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authFormController =
    ChangeNotifierProvider((ref) => MyAuthFormController());
final authRepositoryProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  ref.read(authControllerProvider);
  return authRepository.authStateChanges;
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(
      AuthState(),
      ref.watch(authRepositoryProvider),
    );
  },
);
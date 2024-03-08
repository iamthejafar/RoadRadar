import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadradar/src/dependency_injection/dependency_injection.dart';
import 'package:roadradar/src/features/auth/domain/usecase/login.dart';


enum AuthState { initial, authenticated, unauthenticated }

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase) : super(AuthState.initial);

  Future<void> login(String email, String password) async {
    bool res = false;
    try {
      final dataState = await loginUseCase.call(Params(email: email, password: password));
      if (dataState.data != null) {
        state = AuthState.authenticated;
      } else {
        print('Login failed: ${dataState.error!.message ?? "Unknown error"}');
      }
    } catch (e) {
      // Handle login exception
      print('Error during login: $e');
    }
  }

  Future<void> signOut() async {

    state = AuthState.unauthenticated;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return locator<AuthNotifier>();
});

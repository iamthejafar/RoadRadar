import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadradar/src/dependency_injection/dependency_injection.dart';
import 'package:roadradar/src/features/auth/domain/usecase/login.dart';
import 'package:roadradar/src/features/auth/domain/usecase/signup.dart';
import 'package:roadradar/src/utils/shared_preferences/shared_preferences.dart';


enum AuthState { initial, authenticated, unauthenticated }

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthNotifier(this.loginUseCase, this.signUpUseCase) : super(AuthState.initial);

  Future<bool> login(String email, String password) async {
    bool res = false;
    try {
      final dataState = await loginUseCase.call(LoginParams(email: email, password: password));
      if (dataState.data != null) {
        state = AuthState.authenticated;
        UserPreferences.setUser(userId: dataState.data!['userId'], token: dataState.data!["token"]);
        res = true;
      } else {
        print('Login failed: ${dataState.error!.message ?? "Unknown error"}');
      }
    } catch (e) {
      // Handle login exception
      print('Error during login : $e');
    }

    return res;
  }

  Future<bool> signUp(String email, String password) async {
    bool res = false;
    try {
      final dataState = await signUpUseCase.call(SignUpParams(email: email, password: password));
      if (dataState.data != null) {
        state = AuthState.authenticated;
        await UserPreferences.setUser(userId: dataState.data!['userId'], token: dataState.data!["token"]);
        res = true;
      } else {
        print('Login failed: ${dataState.error!.message ?? "Unknown error"}');
      }
    } catch (e) {
      // Handle login exception
      print('Error during login : $e');
    }

    return res;
  }


  Future<void> signOut() async {

    state = AuthState.unauthenticated;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return locator<AuthNotifier>();
});

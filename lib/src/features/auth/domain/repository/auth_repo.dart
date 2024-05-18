
import 'package:roadradar/src/features/auth/domain/entity/user.dart';

import '../../../../comman/models/data_state.dart';

abstract class AuthRepository {
  Future<DataState<dynamic>> login({required String email, required String password});
  Future<DataState<String>> signUp({required String email, required String password});

}
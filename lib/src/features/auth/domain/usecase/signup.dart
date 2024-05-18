
import 'package:equatable/equatable.dart';

import '../../../../comman/models/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/user.dart';
import '../repository/auth_repo.dart';

class SignUpUseCase implements UseCase<DataState<dynamic>, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call(SignUpParams params) async {
    return await _repository.signUp(email: params.email, password: params.password);
  }
}


class SignUpParams extends Equatable {
  String email;
  String password;

  SignUpParams({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}
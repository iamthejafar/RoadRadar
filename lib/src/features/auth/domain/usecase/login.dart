
import 'package:equatable/equatable.dart';

import '../../../../comman/models/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/user.dart';
import '../repository/auth_repo.dart';

class LoginUseCase implements UseCase<DataState<UserEntity>, Params> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(Params params) async {
    return await _repository.login(email: params.email, password: params.password);
  }
}


class Params extends Equatable {
  String email;
  String password;

  Params({required this.email,required this.password});

  @override
  List<Object?> get props => [email,password];
}
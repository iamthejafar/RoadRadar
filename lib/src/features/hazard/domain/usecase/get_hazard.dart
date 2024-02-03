import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../domain/data_state.dart';
import '../entity/hazard.dart';
import '../repository/hazard/hazard_repo.dart';

class GetArticleUseCase implements UseCase<DataState<List<HazardEntity>>, Params> {
  final HazardRepository _repository;

  GetArticleUseCase(this._repository);

  @override
  Future<DataState<List<HazardEntity>>> call(Params params) async {
    return await _repository.getHazards(page: params.page, size: params.size);
  }
}


class Params extends Equatable {
  int? page;
  int? size;

  Params({this.page,this.size});

  @override
  List<Object?> get props => [page,size];
}
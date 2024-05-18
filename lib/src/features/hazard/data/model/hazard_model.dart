import 'package:json_annotation/json_annotation.dart';
import 'package:roadradar/src/comman/models/image_model.dart';

import '../../domain/entity/hazard.dart';

part 'hazard_model.g.dart';

@JsonSerializable()
class HazardModel extends HazardEntity {
  const HazardModel({
    required String userId,
    required String description,
    required List<ImageModel> hazardImages,
    required List<double> coordinates,
    required String hazardType,
  }) : super(
            userId: userId,
            description: description,
            hazardImages: hazardImages,
            coordinates: coordinates,
            hazardType: hazardType);

  factory HazardModel.fromJson(Map<String, dynamic> json) =>
      _$HazardModelFromJson(json);

  Map<String, dynamic> toJson() => _$HazardModelToJson(this);
}

import 'package:equatable/equatable.dart';
import 'package:roadradar/src/comman/models/image_model.dart';

class HazardEntity extends Equatable{

  final String userId;
  final String description;
  final List<ImageModel> hazardImages;
  final List<double> coordinates;
  final String hazardType;


  const HazardEntity({
    required this.userId,
    required this.description,
    required this.hazardImages,
    required this.coordinates,
    required this.hazardType,
  });

  @override
  List < Object ? > get props {
    return [
      userId,
      description,
      hazardImages,
      coordinates,
      hazardType
    ];
  }
}
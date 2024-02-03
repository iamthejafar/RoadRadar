import 'package:equatable/equatable.dart';
import 'package:roadradar/src/comman/models/image_model.dart';

class HazardEntity extends Equatable{

  final String? uid;
  final String? description;
  final List<ImageModel>? hazardImages;
  final List<double>? coordinates;
  final String? hazardType;


  const HazardEntity({
    this.uid,
    this.description,
    this.hazardImages,
    this.coordinates,
    this.hazardType,
  });

  @override
  List < Object ? > get props {
    return [
      uid,
      description,
      hazardImages,
      coordinates,
      hazardType
    ];
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HazardModel _$HazardModelFromJson(Map<String, dynamic> json) => HazardModel(
      userId: json['userId'] as String,
      description: json['description'] as String,
      hazardImages: (json['hazardImages'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      hazardType: json['hazardType'] as String,
    );

Map<String, dynamic> _$HazardModelToJson(HazardModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'description': instance.description,
      'hazardImages': instance.hazardImages,
      'coordinates': instance.coordinates,
      'hazardType': instance.hazardType,
    };

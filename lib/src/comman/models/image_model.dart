


import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';
@JsonSerializable()
class ImageModel {
  final String mimeType;
  final String url;

  ImageModel({required this.mimeType, required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}


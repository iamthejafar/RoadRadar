



import 'package:cloud_firestore/cloud_firestore.dart';

class HazardIssueModel {
  final String uid;
  final String description;
  final List<String> images;
  final List<double> coordinates;
  final String hazardType;

  HazardIssueModel({
    required this.uid,
    required this.description,
    required this.images,
    required this.coordinates,
    required this.hazardType,
  });

  // Factory constructor to create an Issue instance from a Map
  factory HazardIssueModel.fromJson(Map<String, dynamic> json) {
    return HazardIssueModel(
      uid: json['uid'] ?? '',
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      coordinates: List<double>.from(json['coordinates'] ?? []),
      hazardType: json['hazardType'] ?? '',
    );
  }

  // Factory constructor to create an Issue instance from a Firestore DocumentSnapshot
  factory HazardIssueModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return HazardIssueModel(
      uid: snapshot.id,
      description: data['description'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      coordinates: List<double>.from(data['coordinates'] ?? []),
      hazardType: data['hazardType'] ?? '',
    );
  }

  // Method to convert the Issue instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'description': description,
      'images': images,
      'coordinates': coordinates,
      'hazardType': hazardType,
    };
  }
}

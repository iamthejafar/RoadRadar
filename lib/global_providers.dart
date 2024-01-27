import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

final pickedImageProvider = StateNotifierProvider
    .family<PickedImageNotifier, List<File>, String>((ref, id) {
  return PickedImageNotifier(ref, id: id);
});

class PickedImageNotifier extends StateNotifier<List<File>> {
  PickedImageNotifier(this.ref, {required this.id}) : super([]);

  final String id;

  final Ref ref;

  setImages(List<File> images) {
    state = images;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:roadradar/src/dependency_injection/dependency_injection.dart';

import '../../domain/entity/hazard.dart';
import '../../domain/usecase/get_hazard.dart';

enum HazardNotifierState {
  idle,
  loading,
  loaded,
  error,
}

class HazardState {
  final List<HazardEntity> hazards;
  final String? error;
  final HazardNotifierState state;

  HazardState({
    required this.hazards,
    this.error,
    this.state = HazardNotifierState.idle,
  });
}

class HazardNotifier extends StateNotifier<HazardState> {
  final GetHazardsUseCase getArticleUseCase;
  int currentPage = 1;
  final ScrollController scrollController = ScrollController();

  HazardNotifier(this.getArticleUseCase) : super(HazardState(hazards: [])) {
    // Attach a listener to the scrollController
    scrollController.addListener(_scrollListener);

    // Initial loading
    getHazards(10); // Adjust the size parameter based on your requirements
  }

  void _scrollListener() {
    // Check if the user has reached the end of the list
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      // Trigger lazy loading when the end is reached
      getHazards(10); // Adjust the size parameter based on your requirements
    }
  }

  Future<void> getHazards(int size) async {
    try {
      state = HazardState(hazards: state.hazards, state: HazardNotifierState.loading);

      final dataState = await getArticleUseCase.call(GetHazardParam(page: currentPage, size: size));
      if (dataState.data != null) {
        state = HazardState(hazards: [...state.hazards, ...dataState.data!], state: HazardNotifierState.loaded);
        currentPage++;
      } else if (dataState.error != null) {
        state = HazardState(
          hazards: state.hazards,
          error: dataState.error!.message ?? 'Unknown error',
          state: HazardNotifierState.error,
        );
      } else {
        state = HazardState(hazards: state.hazards, error: 'Unknown error', state: HazardNotifierState.error);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      state = HazardState(hazards: state.hazards, error: 'Error fetching hazards: $e', state: HazardNotifierState.error);
    }
  }
}



final hazardProvider = StateNotifierProvider<HazardNotifier,HazardState>((ref) => locator<HazardNotifier>());

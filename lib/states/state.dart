import 'package:flutter_riverpod/flutter_riverpod.dart';

final interestIdsStateNotifierProvider = StateNotifierProvider<InterestIdsStateNotifier, List<int>>((ref) => InterestIdsStateNotifier());

class InterestIdsStateNotifier extends StateNotifier<List<int>> {
  InterestIdsStateNotifier(): super([]);

  int get totalItem => state.length;

  set updateData(int interestId) {
    if (!state.contains(interestId)) {
      state = [...state, interestId];
    } else {
      state.remove(interestId);
      state = [...state];
    }
  }
}

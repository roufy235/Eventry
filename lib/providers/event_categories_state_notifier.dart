import 'package:eventry/models/firebase/event_category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventCategoriesStateNotifier extends StateNotifier<List<EventCategoryModel>> {
  EventCategoriesStateNotifier(): super([]);

  set updateList(List<EventCategoryModel> categories) {
    state.clear();
    state = [...categories];
  }

  List<EventCategoryModel> get getDate => state;
}

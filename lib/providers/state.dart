import 'package:eventry/models/hive/user_data_hive.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/providers/interest_ids_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final interestIdsStateNotifierProvider = StateNotifierProvider<InterestIdsStateNotifier, List<int>>((ref) => InterestIdsStateNotifier());

final userDataProvider = StateProvider<UserDataHive>((ref) {
  return HiveRepository().getUserData;
});

final StateProvider bottomNavigationCurrentIndexProvider = StateProvider<int>((ref) => 0);

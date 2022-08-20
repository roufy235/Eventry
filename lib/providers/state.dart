import 'package:eventry/models/hive/user_data_hive.dart';
import 'package:eventry/models/interest_model.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/providers/interest_ids_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final interestIdsStateNotifierProvider = StateNotifierProvider<InterestIdsStateNotifier, List<int>>((ref) => InterestIdsStateNotifier());

final userDataProvider = StateProvider<UserDataHive>((ref) {
  return HiveRepository().getUserData;
});

final StateProvider bottomNavigationCurrentIndexProvider = StateProvider<int>((ref) => 0);

final StateProvider interestProvider = StateProvider<List<InterestModel>>((ref) {
  return [
    InterestModel(id: 1, text: 'Art', icon: FontAwesomeIcons.clipboard),
    InterestModel(id: 2, text: 'Music', icon: FontAwesomeIcons.music),
    InterestModel(id: 3, text: 'Sport', icon: FontAwesomeIcons.football),
    InterestModel(id: 4, text: 'Food', icon: FontAwesomeIcons.burger),
    InterestModel(id: 5, text: 'Party', icon: FontAwesomeIcons.champagneGlasses),
    InterestModel(id: 6, text: 'Technology', icon: FontAwesomeIcons.microchip),
  ];
});

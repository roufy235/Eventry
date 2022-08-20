import 'package:eventry/models/featured_model.dart';
import 'package:eventry/models/hive/user_data_hive.dart';
import 'package:eventry/models/interest_model.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/providers/interest_ids_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eventry/config/config.dart';

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

final StateProvider featuredProvider = StateProvider<List<FeaturedModel>>((ref) {
  return [
    FeaturedModel(
        id: 1,
        text: 'International Concert',
        imagePath: internationalConcert,
        btnText: 'Book Now'
    ),
    FeaturedModel(
        id: 2,
        text: 'Local Concert',
        imagePath: localConcert,
        btnText: 'Book Now'
    ),
    FeaturedModel(
        id: 3,
        text: 'Gala Music Festival',
        imagePath: galaConcert,
        btnText: 'Book Now'
    ),
    FeaturedModel(
        id: 4,
        text: 'Art Workshop Training',
        imagePath: artTrainingConcert,
        btnText: 'Book Now'
    ),
    FeaturedModel(
        id: 5,
        text: 'Sport Training Time',
        imagePath: sportTrainingConcert,
        btnText: 'Book Now'
    ),
  ];
});

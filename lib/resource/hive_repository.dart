import 'package:eventry/models/firebase/user_model.dart';
import 'package:eventry/models/hive/user_data_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Hive constants
const String boxName = 'eventryBoxV1';

class HiveRepository {
  final Box _box = Hive.box(boxName);
  final String _boxIsOnboardingViewed = 'isOnboardingViewed';
  final String _userDataKey = 'userData';
  final String _saveRecentLoginEmailKey = 'saveRecentLoginEmail';

  Future<void> saveUserData(UserModel user) async {
    await _box.put(_userDataKey, UserDataHive(
        phone: user.phone,
        fullName: user.fullName,
        email: user.email,
        uid: user.uid
    ));
  }

  Future<void> saveRecentLoginEmail(String email) async {
    await _box.put(_saveRecentLoginEmailKey, email);
  }

  Future<void> onboardingViewedStatus(int status) async {
    await _box.put(_boxIsOnboardingViewed, status);
  }

  String? get getSaveRecentLoginEmail => _box.get(_saveRecentLoginEmailKey);
  UserDataHive get getUserData => _box.get(_userDataKey);
  int? get getOnboardingViewedStatus => _box.get(_boxIsOnboardingViewed);
}

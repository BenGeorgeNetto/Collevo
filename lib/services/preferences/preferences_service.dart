import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collevo/services/auth/auth_service.dart';
import 'package:collevo/services/auth/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<SharedPreferences> _getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return _getSharedPreferencesInstance();
  }

  Future<String?> getEmail() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('email');
  }

  Future<String?> getName() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('name');
  }

  Future<String?> getRollNo() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('roll_no');
  }

  Future<String?> getStudentId() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('s_id');
  }

  Future<String?> getBatch() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('batch');
  }

  Future<String?> getDept() async {
    final preferences = await _getSharedPreferencesInstance();
    return preferences.getString('dept');
  }

  Future<void> setUserDetails(String email) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('students')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final userData = snapshot.docs.first.data() as Map<String, dynamic>?;
      if (userData != null) {
        final userName = userData['s_name'] as String?;
        final rollNo = userData['roll_no'] as String?;
        final studentId = userData['s_id'] as String?;
        final batch = userData['batch'] as String?;
        final dept = userData['dept'] as String?;

        final preferences = await SharedPreferences.getInstance();
        preferences.setString('email', email);
        preferences.setString('name', userName ?? '');
        preferences.setString('roll_no', rollNo ?? '');
        preferences.setString('s_id', studentId ?? '');
        preferences.setString('batch', batch ?? '');
        preferences.setString('dept', dept ?? '');

        return;
      }
    }
  }

  Future<void> setUid() async {
    final preferences = await _getSharedPreferencesInstance();
    final AuthService authService = AuthService.firebase();
    final AuthUser? currentUser = authService.currentUser;

    preferences.setString('uid', currentUser?.id ?? '');
  }
}

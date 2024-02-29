import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionCheckService {
  final FirebaseFirestore firestore;

  VersionCheckService(this.firestore);

  Future<UpdateCheckResult> isUpdateRequired() async {
    print("Checking for updates in version check service");
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    final docSnapshot =
        await firestore.collection('appData').doc('latestVersion').get();
    final latestVersion = docSnapshot.data()?['version'] as String? ?? '';

    return UpdateCheckResult(
      updateRequired: _compareVersion(currentVersion, latestVersion) < 0,
      currentVersion: currentVersion,
      latestVersion: latestVersion,
    );
  }

  int _compareVersion(String currentVersion, String latestVersion) {
    // Split version numbers to major, minor, and patch
    var currentVersionParts =
        currentVersion.split('-')[0].split('.').map(int.tryParse).toList();
    var latestVersionParts =
        latestVersion.split('-')[0].split('.').map(int.tryParse).toList();

    // Normalize length of version parts by appending "0" where parts are missing
    int lengthDifference =
        currentVersionParts.length - latestVersionParts.length;
    if (lengthDifference > 0) {
      latestVersionParts.addAll(List.filled(lengthDifference, 0));
    } else if (lengthDifference < 0) {
      currentVersionParts.addAll(List.filled(-lengthDifference, 0));
    }

    // Compare each part
    for (int i = 0; i < currentVersionParts.length; i++) {
      int currentPart = currentVersionParts[i] ?? 0; // Use 0 if null
      int latestPart = latestVersionParts[i] ?? 0; // Use 0 if null
      if (currentPart < latestPart) return -1;
      if (currentPart > latestPart) return 1;
    }
    // Versions are equal
    return 0;
  }
}

class UpdateCheckResult {
  final bool updateRequired;
  final String currentVersion;
  final String latestVersion;

  UpdateCheckResult({
    required this.updateRequired,
    required this.currentVersion,
    required this.latestVersion,
  });
}

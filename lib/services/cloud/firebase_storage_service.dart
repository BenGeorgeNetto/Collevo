import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class FirebaseStorageService {
  static Future<String> uploadImage(String uid, String imagePath) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child('requests').child(uid).child(path.basename(imagePath));
    final UploadTask uploadTask = storageRef.putFile(File(imagePath));
    final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() => null);
    final String imageUrl = await storageSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
}

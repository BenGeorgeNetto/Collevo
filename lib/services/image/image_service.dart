// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageService {
  static String? imagePath;

  static Future<void> getImageFromCamera(
      void Function(String?) setImagePath) async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      // Have no permission to camera
      return;
    }

    // Generate filepath for saving
    String? imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      //Make sure to await the call to detectEdge.
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning', // use custom localizations for android
        androidCropTitle: 'Crop',
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      // print("success: $success");
    } catch (e) {
      // print(e);
    }

    if (!await File(imagePath).exists()) {
      imagePath = null;
    }

    ImageService.imagePath = imagePath;
    setImagePath(imagePath);
  }

  static Future<void> getImageFromGallery(
      void Function(String?) setImagePath) async {
    String? imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      //Make sure to await the call to detectEdgeFromGallery.
      bool success = await EdgeDetection.detectEdgeFromGallery(
        imagePath,
        androidCropTitle: 'Crop', // use custom localizations for android
        androidCropBlackWhiteTitle: 'Black White',
        androidCropReset: 'Reset',
      );
      // print("success: $success");
    } catch (e) {
      // print(e);
    }

    if (!await File(imagePath).exists()) {
      imagePath = null;
    }

    ImageService.imagePath = imagePath;
    setImagePath(imagePath);
  }
}

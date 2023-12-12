// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

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
      return;
    }

    String? imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    try {
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: true,
        androidScanTitle: 'Scanning',
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

    final fileSize = await File(imagePath!).length();
    const threshold = 2048 * 2048;
    final quality = fileSize > threshold ? 50 : 80;

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      imagePath,
      imagePath.replaceFirst('.jpeg', '_compressed.jpeg'),
      quality: quality,
    );

    imagePath = compressedImage?.path;

    ImageService.imagePath = imagePath;
    setImagePath(imagePath);
  }

  static Future<void> getImageFromGallery(
      void Function(String?) setImagePathCallback) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      setImagePathCallback(null);
      return;
    }

    String? imagePath = pickedFile.path;

    final fileSize = await File(imagePath).length();
    const threshold = 2048 * 2048;
    final quality = fileSize > threshold ? 50 : 80;

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      imagePath,
      imagePath.replaceFirst('.jpeg', '_compressed.jpeg'),
      quality: quality,
    );

    imagePath = compressedImage?.path;
    ImageService.imagePath = imagePath;
    setImagePathCallback(imagePath);
  }
}

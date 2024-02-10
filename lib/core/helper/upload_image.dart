import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future <File?> uploadImageToApi(XFile image) async {
  PermissionStatus status;
  if (Platform.isAndroid) {
    final andriodInfo = await DeviceInfoPlugin().androidInfo;
    if (andriodInfo.version.sdkInt <= 32) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.phone.request();
    }
  } else {
    status = await Permission.storage.request();
  }
  if (status.isGranted) {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
  return null;
}

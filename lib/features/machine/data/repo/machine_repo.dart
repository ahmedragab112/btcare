
import 'dart:io';

import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/features/machine/data/models/api_response.dart';

abstract class MachineRepo {
  Future<ApiResponse<MachineResponse>> uploadImage(File image);
}

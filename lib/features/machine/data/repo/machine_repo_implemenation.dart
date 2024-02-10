
import 'dart:io';

import 'package:btcare/core/api/api_response.dart';
import 'package:btcare/features/machine/data/models/api_response.dart';
import 'package:btcare/features/machine/data/repo/machine_repo.dart';
import 'package:btcare/features/machine/data/service/api_service.dart';

class MachineRepoImplementation implements MachineRepo {
  MachineWebService machineWebService;
  MachineRepoImplementation(this.machineWebService);
  @override
  Future<ApiResponse<MachineResponse>> uploadImage(File files) async {
    try {
      var data = await machineWebService.uploadImage(files);
      return ApiResponse.data(data);
    } catch (e) {
     return ApiResponse.error(error: e.toString());
    }
  }
}

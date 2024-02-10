import 'dart:convert';

import 'package:dio/dio.dart';

void main() async {
  var data = FormData.fromMap({
    'image': [
      await MultipartFile.fromFile('D:/flutter project/btcare/assets/test.jpeg',
          filename: 'test.jpg'),
    ],
  });

  var dio = Dio();
  var response = await dio.request(
    'http://localhost:5000/upload',
    options: Options(
      method: 'POST',
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  } else {
    print(response.statusMessage);
  }
}

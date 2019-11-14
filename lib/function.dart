import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class Post {
  final String text;

  Post({this.text});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
    );
  }
}

Future<String> getText(File file, String path) async {
  // String base64audio = base64Encode(file.readAsBytesSync());
  // print(base64audio);
  
  FormData formData = new FormData.fromMap({
    "text": "wendux",
    "file": await MultipartFile.fromFile(path),
  });
  Dio dio = new Dio();
  Response response = await dio.post("http://192.168.2.8:8000/voice/v", data: formData);
  print(response.data); 
  // Post t = Post.fromJson(json.decode(response.data));
  // return t.toString();
  return response.data['text'];
  // String url = "http://192.168.2.8:8000/voice/v";
  // Uri uri = Uri.parse(url);
  // var request = http.MultipartRequest("POST", uri);
  // request.fields['text'] = 'jitendra';
  // request.files.add(
  //   await http.MultipartFile.fromPath(
  //     'file',
  //     path.toString(),
  //     // contentType: new MediaType(),
  //   ),
  // );
  // var response = await request.send();
  // http.Response response = await http.post(
  //   Uri.encodeFull(url),
  //   headers: {"Accept": "application/json"},
  //   body: {
  //     "text": "jitendra",
  //     "file": base64audio
  //     // base64audio
  //   },
  // );
}

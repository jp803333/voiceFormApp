import 'package:dio/dio.dart';

class Post {
  final String text;

  Post({this.text});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
    );
  }
}

Future<String> getText(String ipadd, String path) async {
  FormData formData = new FormData.fromMap({
    "text": "wendux",
    "file": await MultipartFile.fromFile(path),
  });
  Dio dio = new Dio();
  print("http://" + ipadd + ":8000/voice/v");
  String url = "http://" + ipadd + ":8000/voice/v";
  Response response = await dio.post(url, data: formData);
  print(response.data);
  return response.data['text'];
  // sample http response and request
  // var response = await request.send();
  // http.Response response = await http.post(
  //   Uri.encodeFull(url),
  //   headers: {"Accept": "application/json"},
  //   body: {
  //     "text": "jitendra",
  //   },
  // );
}

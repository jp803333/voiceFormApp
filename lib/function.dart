
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final String text;

  Post({this.text});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      text: json['text'],
    );
  }
}

Future<String> getText(String path) async{
    http.Response  response  = await http.post(
      Uri.encodeFull("http://192.168.2.8:8000/voice/v"),
      headers: {
        "Accept":"application/json"
      },
      body: {
        "text":"jitendra"
      }
    );
    print(response.body);
    Post t = Post.fromJson(json.decode(response.body));
    return t.text;
  }

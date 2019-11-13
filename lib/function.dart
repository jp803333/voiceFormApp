
import 'package:http/http.dart' as http;

Future<String> getText(String path) async{
    http.Response  response  = await http.put(
      Uri.encodeFull("http://192.168.2.8:8000/voiceform"),
      headers: {
        "Accept":"application/json"
      }
    );
    print(response.body);
    return response.body;
  }

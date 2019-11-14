import 'package:flutter/material.dart';
import 'package:recorder_wav/recorder_wav.dart';
import 'function.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = ' ';
  bool _recording = false;
  Color _color = Colors.black;
  String _ipaddress;
  TextEditingController _ipcontroller = new TextEditingController();
  void _voice() async {
    if (!_recording) {
      RecorderWav.startRecorder();
      setState(() {
        _recording = !_recording;
        _color = Colors.amber;
      });
    } else {
      String filePath = await RecorderWav.StopRecorder();
      print(filePath);
      getText(_ipaddress, filePath).then((str) {
        setState(() {
          _counter = str;
          _recording = !_recording;
          _color = Colors.black;
          // RecorderWav.removeRecorderFile(filePath);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: _ipcontroller,
            ),
            InkWell(
              child: Text('submit'),
              onTap: () {
                _ipaddress = _ipcontroller.text;
                print(_ipaddress);
              },
            ),
            Text(
              '$_counter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _voice,
        child: Icon(
          Icons.mic,
          color: _color,
        ),
      ),
    );
  }
}

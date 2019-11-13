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

  // From her to .....
  // .................
  void _voice() async {
    // _counter++;
    if (!_recording) {
      RecorderWav.startRecorder();
      setState(() {
        _recording = !_recording;
        _color = Colors.amber;
      });
    } else {
      String filePath = await RecorderWav.StopRecorder();
      // RecorderWav.removeRecorderFile(filePath);
      setState(() {
        _counter = getText(filePath).toString();
        _recording = !_recording;
        _color = Colors.black;
      });
    }
  }
  // ....................
  // ..............to here dont change.


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _voice,
        // tooltip: 'Increment',
        child: Icon(
          Icons.mic,
          color: _color,
        ),
      ),
    );
  }
}

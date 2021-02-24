import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isListen = false;
  String _text = 'Empieza...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Speech app'),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: Text(_text)), _botonesContent()],
          ),
        ));
  }

  Widget _botonesContent() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _listener,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                color: _isListen ? Colors.cyan : Colors.grey[300],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 1), blurRadius: 1)
                ]),
            child: Icon(
              Icons.mic,
              color: _isListen ? Colors.white : Colors.black87,
            ),
          ),
        )
      ],
    ));
  }

  void _listener() async {
    stt.SpeechToText speech = stt.SpeechToText();
    if (!_isListen) {
      bool available = await speech.initialize(
          onStatus: _statusListener, onError: (v) => print(v));
      if (available) {
        _isListen = true;
        speech.listen(onResult: _resultListener);
      } else {
        print("The user has denied the use of speech recognition.");
      }
      // some time later...
    } else {
      _isListen = false;
      speech.stop();
    }
    setState(() {});
  }

  void _resultListener(SpeechRecognitionResult result) {
    print('Se esta escuchando');
    print(result.recognizedWords);
    _text = result.recognizedWords;
    setState(() {});
  }

  void _statusListener(String status){
    print('status: ' + status);
    if(status ==  'notListening') setState(() {
      _isListen = false;
    });
  }
}

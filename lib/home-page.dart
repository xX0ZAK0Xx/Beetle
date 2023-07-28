import 'package:beetle/feature-box.dart';
import 'package:beetle/pallete.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  void initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }
  void stopListening() async {
    await speechToText.stop();
    setState(() {});
  }
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beetle"),
        leading: Icon(Icons.menu),
      ),
      body: ListView(
        children: [
          Column(children: [
            //Asistant Image
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/images/virtualAssistant.png")),
                  ),
                )
              ],
            ),
        
            //Greetings from Ai
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15 ),
              margin: EdgeInsets.all(20),
              child: const Text("Good Morning, What can I do for you?", style: Pallete.textStyle1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                border: Border.all(color: Pallete.borderColor)
              ),
            ),
        
            //Suggestions
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal:20),
              child: Text("Here are few features", style: Pallete.titleStyle, ),
            ),
        
            //Features
            FeatureBox(boxTitle: "Chat-GPT", boxDesc: "A smarter way to stay organized and informed with ChatGPT", boxColor: Pallete.firstSuggestionBoxColor,),
            FeatureBox(boxTitle: "Dall-E", boxDesc: "Get inspired and stay creative with your personal assistant powered by Dall-E", boxColor: Pallete.secondSuggestionBoxColor,),
            FeatureBox(boxTitle: "Voice Assistant", boxDesc: "Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT", boxColor: Pallete.thirdSuggestionBoxColor,),
          ]
          ),
        ]    
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.mic_none_rounded),
        backgroundColor: Pallete.firstSuggestionBoxColor,
      ),
    );
  }
}


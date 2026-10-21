import 'package:flutter/material.dart';

void main() {
  runApp(Jebrew());
}

class Jebrew extends StatefulWidget {
  const Jebrew({super.key});

  @override
  JebrewState createState() => JebrewState();
}

class JebrewState extends State<Jebrew> {
  List<String> totalWords = List.empty();
  List<String> knownWords = List.empty();
  double precentageKnown = 0;

  JebrewState();

  void AddWordToKnownWords(String word) { 
      //TODO: add this addwords later bs
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWords(
      totalWords: totalWords,
      knownWords: knownWords,
      precentageKnown: precentageKnown,
      addWord: AddWordToKnownWords,
      child: MaterialApp(title: "Jebrew", theme: ThemeData(primarySwatch: Colors.blue), home:HomePage()),
    );
  }
} 

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
TextEditingController ctrlr = TextEditingController();

@override
void dispose() {
  ctrlr.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Gives the width
    final screenHeight = MediaQuery.of(context).size.height; // Gives the height
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Words dayo")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              height: screenHeight * 0.15,
              width: screenWidth * 0.15,
              child: Text("Welcome to the app"),
            ),

            //more
          ],
        ),
      ),
    );
  }
}

class InheritedWords extends InheritedWidget {
  final List<String> totalWords;
  final double precentageKnown;
  final List<String> knownWords;
  final ValueChanged<String> addWord; // to known

  const InheritedWords({
    required this.totalWords,
    required this.knownWords,
    required super.child,
    required this.addWord,
    required this.precentageKnown,
  });

  static InheritedWords of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWords>()!;
  }

  @override
  bool updateShouldNotify(InheritedWords oldWidget) {
    return knownWords != oldWidget.knownWords;
  }
}

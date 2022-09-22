import 'Story_Brain.dart';
import 'package:destioni_app/Story_Brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                storyBrain.getStory(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {
                String correctAnswer = storyBrain.getChoice1();
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                storyBrain.getChoice1(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 2,
            child: Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: TextButton(
                onPressed: () {
                  String correctAnswer = storyBrain.getChoice2();
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  storyBrain.getChoice2(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

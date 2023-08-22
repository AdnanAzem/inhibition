import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

Icon getRandomArrow() {
  Random random = Random();
  int choice = random.nextInt(2);

  // Set the arrow icon based on the chosen choice
  IconData iconData = choice == 0 ? Icons.arrow_back : Icons.arrow_forward;
  Icon res = Icon(
    iconData,
    size: 50,
    color: getRandomRedOrGreenColor(),
  );
  return res;
}

Color getRandomRedOrGreenColor() {
  Random random = Random();

  // Generate a random number (0 or 1) to choose between red and green
  int choice = random.nextInt(2);

  // Set the color component values based on the chosen color
  int red = choice == 0 ? 255 : 0;
  int green = choice == 1 ? 255 : 0;
  int blue = 0; // Set blue to 0 for a pure red or green color

  // Create a Color object using the chosen color components
  Color color = Color.fromARGB(255, red, green, blue);
  return color;
}

String getRandomPhoto() {
  final List<String> photoAssets = [
    'asserts/images/arrows2.png',
    'asserts/images/rainbow2.jpeg'
  ];

  Random random = Random();
  int randomIndex = random.nextInt(photoAssets.length);
  return photoAssets[randomIndex];
}

class _GamePageState extends State<GamePage> {
  bool isButtonPressed = false;
  Timer? longPressTimer;
  DateTime? startTime;
  Icon randomArrow = getRandomArrow();
  String randomPhoto = getRandomPhoto();

  void cancelTimer() {
    longPressTimer?.cancel();
  }

  void startTimer() {
    startTime = DateTime.now();
    longPressTimer = Timer(Duration(seconds: 10), () {
      setState(() {
        cancelTimer();
        DateTime endTime = DateTime.now();
        Duration responseTime = endTime.difference(startTime!);
        print('Response time: ${responseTime.inMilliseconds} milliseconds');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("red");
                    startTimer();
                    randomArrow = getRandomArrow();
                    randomPhoto = getRandomPhoto();
                  });
                },
                child: Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(randomPhoto),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: randomArrow,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      onLongPress: () {
                        setState(() {
                          print("Hold");
                          startTimer();
                          isButtonPressed = true;
                        });
                      },
                      // isButtonPressed = false,
                      child: Text("keep holding!"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonPressed?Colors.purple: Colors.grey,
                        padding: EdgeInsets.all(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            // color: Colors.black,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("green");
                    startTimer();
                    randomArrow = getRandomArrow();
                    randomPhoto = getRandomPhoto();
                  });
                },
                child: Text(""),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

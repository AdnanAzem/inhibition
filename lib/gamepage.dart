import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
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
                Expanded(flex: 3, child: Center(child: Icon(Icons.arrow_forward, size: 50, color: Colors.white),),),
                Expanded(child: Center(child: Text(""),),),
                Expanded(flex: 3, child: Center(child: Icon(Icons.arrow_back, size: 50, color: Colors.white),),),
                
                  // child: Icon(Icons.arrow_back, size: 50, color: Colors.white),
                  // color: Colors.black,
                
              ],
            ),
          ),
          Expanded(
            flex: 1,
            // color: Colors.black,
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
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

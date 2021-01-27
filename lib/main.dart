import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Controller extends ChessBoardController {

}

class _MyHomePageState extends State<MyHomePage> {
  List<String> moveLog = [];
  String whitePlayerName = 'White Player', blackPlayerName = 'Black Player';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chess"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10 , 10),
                height: 50,
                color: Colors.brown,
                child: Text(
                  '$blackPlayerName', textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            ChessBoard(
                onMove: (move) {
                  print(move);
                  /*setState(() {
                    moveLog.add(move);
                  });*/
                },
                onCheckMate: (color) {
                  print(color);
                },
                onDraw: () {
                  print("DRAW!!!");
                },
              size: MediaQuery.of(context).size.width,
              enableUserMoves: true,
              boardType: BoardType.orange,
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10 , 10),
                height: 50,
                color: Colors.brown,
                child: Text(
                  '$whitePlayerName', textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                height: 186,
                color: Colors.grey,
                child: Text(
                  'Move: $moveLog'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


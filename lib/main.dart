import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: tic_tac(),
  ));
}
class tic_tac extends StatefulWidget {
  const tic_tac({Key? key}) : super(key: key);

  @override
  State<tic_tac> createState() => _tic_tacState();
}

class _tic_tacState extends State<tic_tac> {
  String p1 = "x";
  String p2 = "0";

  List<String> l = List.filled(9, "");
  int cnt = 0;
  int checkwin = 0;

  String msg = "game is running";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tic tac game.."),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              abc(0),abc(1),abc(2)
            ],
          )),
          Expanded(child: Row(
            children: [abc(3),abc(4),abc(5)],
          )),
          Expanded(child: Row(
            children: [abc(6),abc(7),abc(8)],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: Text(msg,style: TextStyle(fontSize: 30,color: Colors.white),),
              )


          )
            ],
          )),
          ElevatedButton(onPressed: () {
          l =List.filled(9, "");
          msg ="game is running";
          cnt=0;
          checkwin=0;
          setState((){

          });
          }
              child: "restart")),
          )


        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(child: InkWell(
      onTap: () {
        if (l[i] == "" && checkwin == 0) {
          if (cnt % 2 == 0) {
            l[i] = p1;
          }
          else {
            l[i] = p2;
          }
          cnt++;
          win();
          setState(() {

          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue,
        margin: EdgeInsets.all(10),
        child: Text(
          l[i],
          style: TextStyle(fontSize: 50),
        ),
      ),
    ));
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      msg = "$p1 is winner";
      checkwin = 1;
    }
    else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) |
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg = "$p2 is winner";
      checkwin = 1;
    }
    else if(cnt>8){
      msg ="game is draw";
      checkwin =1;
    }
  }
}
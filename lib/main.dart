import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double heightEscale = 50;
  double withEscale = 50;
  int scaleRate = 1;
  int quarterTurn = 0;
  double paddingleft = 50;
  double paddingRigh = 50;
  int paddingActual = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Polyglot sidequest'),
        ),
        body: Stack(
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(
                  bottom: 200, left: paddingleft, right: paddingRigh),
              child: Center(
                child: RotatedBox(
                    quarterTurns: quarterTurn,
                    child: Image.network(
                      'https://static.highsnobiety.com/thumbor/vQLL2siTyzzbG_eq0wWUMFudvDs=/1600x1067/static.highsnobiety.com/wp-content/uploads/2018/07/25125520/ronaldo-medical-stats-01.jpg',
                      height: heightEscale,
                      width: withEscale,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 200,
                height: 200,
             
                child: Column(
                  children: [
                    //Escalado
                    Row(
                      children: [
                        CupertinoButton(
                            child: Text('-'),
                            onPressed: () {
                              escaleLess();
                            }),
                        Text(scaleRate.toString()),
                        CupertinoButton(
                            child: Text('+'),
                            onPressed: () {
                              escaleMore();
                            }),
                        Text('Escalado')
                      ],
                    ),
                    //Rotacion
                    Row(
                      children: [
                        CupertinoButton(
                            child: Text('-'),
                            onPressed: () {
                              turnImageLess();
                            }),
                        Text((quarterTurn + 1).toString()),
                        CupertinoButton(
                            child: Text('+'),
                            onPressed: () {
                              turnImageMore();
                            }),
                        Text('Rotacion')
                        
                      ],
                    ),
                    //Traslacion
                    Row(
                      children: [
                        CupertinoButton(
                            child: Text('-'),
                            onPressed: () {
                              trasLess();
                            }),
                        Text(paddingActual.toString()),
                        CupertinoButton(
                            child: Text('+'),
                            onPressed: () {
                              trasMore();
                            }),
                        Text('Traslacion')
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  turnImageLess() {
    if (quarterTurn > 0) {
      setState(() {
        quarterTurn -= 1;
      });
    }
  }

  turnImageMore() {
    if (quarterTurn < 4) {
      setState(() {
        quarterTurn += 1;
      });
    }
  }

  trasLess() {
    if (paddingRigh > 50) {
      setState(() {
        paddingRigh -= 10;
        paddingActual -= 1;
      });
    }
  }

  trasMore() {
    if (paddingRigh < 90) {
      setState(() {
        paddingRigh += 10;
        paddingActual += 1;
      });
    }
  }

  escaleLess() {
    if (heightEscale > 50) {
      setState(() {
        heightEscale -= 50;
        withEscale -= 50;
        scaleRate -= 1;
      });
    }
  }

  escaleMore() {
    if (heightEscale < 250) {
      setState(() {
        heightEscale += 50;
        withEscale += 50;
        scaleRate += 1;
      });
    }
  }
}

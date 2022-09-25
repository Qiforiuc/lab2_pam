import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();

  getUserInput()
  {
    try {
      var height = int.parse(_textController1.text.toString());
      var weight = int.parse(_textController2.text.toString());
      var num = ((weight/(height*height)) * 10000);
      _textController3.text = num.toStringAsFixed(2);

    } catch(e){
      _textController3.text = "Enter both values";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(
        children: [

          Padding(padding: EdgeInsets.all(15)),
          
          Text(
            _textController3.text.toString(),
            textAlign: TextAlign.center,
          ),

          Padding(padding: EdgeInsets.all(15)),

          TextField(
            controller: _textController1,
            decoration: InputDecoration(
              labelText: "Height",
              border: OutlineInputBorder(), 
              hintText: "Input your height",
              suffixIcon: IconButton(
                onPressed: ()
                {
                  _textController1.clear();
                }, icon: const Icon(Icons.clear),
              )) ,
            keyboardType: TextInputType.number,
          ),

          Padding(padding: EdgeInsets.all(5)),

          TextField(
            controller: _textController2,
            decoration: InputDecoration(
                labelText: "Weight",
                border: OutlineInputBorder(),
                hintText: "Input your weight",
                suffixIcon: IconButton(
                  onPressed: ()
                  {
                    _textController2.clear();
                  }, icon: const Icon(Icons.clear),
                )) ,
            keyboardType: TextInputType.number,
          ),
          
          Padding(padding: EdgeInsets.all(15)),

          MaterialButton(
            onPressed: (){
              getUserInput();
              setState(() {});
            },
              color: Colors.pink,
              child: Text('Calculate', style: TextStyle(color: Colors.white))
          )
        ],
      )
    );
  }
}

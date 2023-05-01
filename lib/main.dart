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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController  = TextEditingController();

  var result = "";
  var bgCOlor = Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(

          child: Container(
            color: bgCOlor,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('BMI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (in feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your HEIGHT (in inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16,),
                OutlinedButton(onPressed: (){
                  var wt  = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();


                  if(wt!="" && ft!="" && inch!=""){
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);
                    var tinch = (ift*12) + iInch;
                    var tCm = tinch*2.54;
                    var tM = tCm/100;
                    var bmi = iwt/(tM+tM);
                    var msg = "";


                    if(bmi>25){
                      msg = 'you are over Weight';
                      bgCOlor = Colors.orange.shade200;

                    }else if(bmi>25){
                      msg = ' you are under Weight';
                      bgCOlor = Colors.redAccent.shade200;

                    }else{
                      msg = 'You are healthy';
                      bgCOlor = Colors.green.shade200;

                    }

                    setState(() {
                      result = '$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}';
                    });

                  }else{
                    setState(() {
                      result = "Please fill the all requirments blank";


                    });
                  }

                }, child: Text('Calculate')),
                SizedBox(height: 16,),
                Text(result, style: TextStyle(fontSize: 18),),
              ],

            ),
          ),
        ),
      )
    );
  }
}

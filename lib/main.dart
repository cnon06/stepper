import 'package:flutter/material.dart';
import 'package:flutter_application_11/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;

  List<Step> steps = [
    const Step(title: Text("Step1"), content: Text("Content1")),
    const Step(title: Text("Step2"), content: Text("Content2")),
    const Step(title: Text("Step3"), content: Text("Content3")),
    const Step(title: Text("Step4"), content: Text("Content4")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Stepper(
                  type: StepperType.vertical,
                  currentStep: currentStep,
                  onStepTapped: (int step) {
                    currentStep = step;
                  },
                  onStepCancel: () {
                    setState(() {
                      if (currentStep > 0) currentStep--;
                      steps[currentStep] = Step(
                          title: Text("Step${currentStep + 1}"),
                          content: Text("Content${currentStep + 1}"),
                          isActive: false);
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                     
                      if (currentStep < steps.length - 1) {
                          steps[currentStep] = Step(
                          title: Text("Step${currentStep + 1}"),
                          content: Text("Content${currentStep + 1}"),
                          isActive: true);
                        currentStep++;
                      }
                      else {
                    
                       Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));
                      }
                      
                    });
                  },
                  steps: steps),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',

      home: const MyHomePage(title: 'Flutter Example App'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Color.fromARGB(255, 52, 110, 54),),
      body: 
      
      Column(        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.amber),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Big Mac')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('image')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('NUTRITIONAL INFO')],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 1, height: 100),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        color: Colors.red,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              //text: 'Hello 1\n',
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '550 CAL.\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'Calories'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        color: Colors.blue,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              //text: 'Hello2 ',
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '30 G\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'Total fat (38% OV)'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        color: Colors.blue,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              // text: 'Hello 3',
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '45 G\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'Total carbs (10% OV)'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        color: Colors.red,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              //text: 'Hello4 ',
                              children: const <TextSpan>[
                                TextSpan(
                                  text: '25 G\n',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: 'Protein'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(width: 100, height: 100, color: Colors.green),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

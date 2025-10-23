import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Профиль пользователя',
      home: Scaffold(
        appBar: AppBar (title: Text('Профиль пользователя'), 
        backgroundColor: Colors.blue),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            SingleChildScrollView(child:
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 1)
                  ),
                  child: CircleAvatar(radius: 60, 
                  backgroundImage: 
                  NetworkImage('https://images.ctfassets.net/tfxr30ndr1hr/5LWf74LfLqRyr5XJ35z31z/390ab6b9850c66553b7d36a585e0035b/16-168770_user-iconset-no-profile-picture-icon-circle-clipart.png?fm=webp&w=1200&q=80'),)
                ),
            ),
        ]),
      ),
    );
  }
}

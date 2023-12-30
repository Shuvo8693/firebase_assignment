import 'package:firebase_assignment/match_screen_a.dart';
import 'package:flutter/material.dart';

import 'match_screen_b.dart';

class ListOfMatchScreen extends StatelessWidget {
  const ListOfMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MatchScreenA()));
              },
              title: const Text('Spain Vs Morocco'),
              trailing: const Icon(Icons.arrow_forward),
              tileColor: Colors.cyan.shade300,
            ),
            const SizedBox(height: 10,),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MatchScreenB()));
              },
              title: const Text('Arsenal Vs RiverPool'),
              trailing: const Icon(Icons.arrow_forward),
              tileColor: Colors.cyan.shade300,
            ),
          ],
        ),
      ),
    );
  }
}

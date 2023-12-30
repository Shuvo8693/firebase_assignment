import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'list_of_match_screen.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FootBallMatch());
}
class FootBallMatch extends StatelessWidget {
  const FootBallMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: ListOfMatchScreen(),
    );
  }
}

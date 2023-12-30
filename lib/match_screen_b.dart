import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Model Class/match_model.dart';

class MatchScreenB extends StatefulWidget {
  const MatchScreenB({super.key});

  @override
  State<MatchScreenB> createState() => _MatchScreenBState();
}

class _MatchScreenBState extends State<MatchScreenB> {
  List<MatchModel>matchModelListB=[];
  Stream<QuerySnapshot> userStreamB=FirebaseFirestore.instance.collection('football match 2').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Team B'),
      ),
      body:StreamBuilder(
        stream: userStreamB,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            log(snapshot.hasError.toString());
          }
          if(snapshot.hasData){
            matchModelListB.clear();
            for(QueryDocumentSnapshot elements in snapshot.data!.docs){
              MatchModel matchModel= MatchModel(
                  elements['duration'],
                  elements['goal'],
                  elements['match duration'],
                  elements['team'],
                  elements.id);
              matchModelListB.add(matchModel);
            }
          }
        return ListView.builder(
          itemCount: matchModelListB.length,
            itemBuilder: (context,index){
          return ListTile(
            title: SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    Text(matchModelListB[index].team,style: Theme.of(context).textTheme.titleLarge,),
                    Text(matchModelListB[index].goal,style: Theme.of(context).textTheme.titleLarge,),
                    Text(matchModelListB[index].duration,style: Theme.of(context).textTheme.titleLarge,),
                    Text(matchModelListB[index].matchDuration,style: Theme.of(context).textTheme.titleLarge,),
                  ],
                ),
              ),
            ),
          );
        });
  }
      ),
    );
  }
}

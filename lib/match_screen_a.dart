import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Model Class/match_model.dart';

class MatchScreenA extends StatefulWidget {
  const MatchScreenA({super.key});

  @override
  State<MatchScreenA> createState() => _MatchScreenAState();
}

class _MatchScreenAState extends State<MatchScreenA> {
  List<MatchModel>matchModelList=[];
  Stream<QuerySnapshot> userStream=FirebaseFirestore.instance.collection('Football match').snapshots();
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Match'),
      ),

      body: StreamBuilder(
          stream: userStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            log(snapshot.hasError.toString());
          }
          if(snapshot.hasData){
            matchModelList.clear(); // clear before
            for(QueryDocumentSnapshot element in snapshot.data!.docs){
               MatchModel matchModel=MatchModel(
                   element['duration'],
                   element['goal'],
                   element['match duration'],
                   element['team'],
                   element.id);
               matchModelList.add(matchModel);
            }
          }
        return ListView.builder(
          itemCount: matchModelList.length,
            itemBuilder: (context,index){
           return
               ListTile(
                 title:SizedBox(
                   width: double.infinity,
                   child: Card(
                     child: Column(
                       children: [
                         Text(matchModelList[index].team,style: Theme.of(context).textTheme.titleLarge,),
                         Text(matchModelList[index].goal,style: Theme.of(context).textTheme.titleLarge,),
                         Text(matchModelList[index].duration,style: Theme.of(context).textTheme.titleLarge,),
                         Text(matchModelList[index].matchDuration,style: Theme.of(context).textTheme.titleLarge,),
                       ],
                     ),
                   ),
                 ) ,
               );
        });
       }
      ),
    );
  }
}


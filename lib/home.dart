import 'package:flutter/material.dart';
import 'package:session/detail.dart';
import 'package:session/session_object.dart';
import 'package:session/shared_pref.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  List <Session> sessions = [];
  void initState(){
      super.initState();
      loadData();
    }
    loadData() async{
      sessions = await My_shared_pref.fetchData();
      if(sessions.isEmpty) sessions.add(Session.makeNew());
      int len = sessions[sessions.length-1].entries.length;
      if(len==Session.entryPerSession) sessions.add(Session.makeNew());
      print("harsh : ${sessions.length}");
      setState(() {});
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Home")),elevation: 0,),
      body: Padding(padding: const EdgeInsets.all(14), child: GridView.builder(
        itemCount: sessions.length,
        // itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return myTile(sessions.length-1-index);
        }),),
    );
  }

  Widget myTile(int i){
    return GestureDetector(
      onTap: ()=> Navigator.push (context, MaterialPageRoute(builder: (context) => Detail(no: i+1, mySession: sessions[i],))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(title: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Session"),
            Text((i+1).toString()),
          ],
        )),tileColor: (i+1==sessions.length)?Colors.green[200] : Colors.orange,),
      ));
  }
}
import 'package:flutter/material.dart';
import 'package:session/home.dart';
import 'package:session/page_routes.dart';
import 'package:session/session_object.dart';
import 'package:session/shared_pref.dart';

class Detail extends StatefulWidget {
  late int no;
  late Session mySession; 
  Detail({super.key, required this.no, required this.mySession});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  
  String entry="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text("Session: ${widget.no.toString()}")),),
    body: Padding(padding: const EdgeInsets.all(14), 
    child: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.mySession.entries.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(title: Text("${index+1} : ${widget.mySession.entries[index]}"));
            }
            ),
        ),
        if(widget.mySession.entries.length<Session.entryPerSession)Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: 
                          TextFormField(
                            onChanged: (value) {
                              entry=value;
                            },
                            textCapitalization: TextCapitalization.characters,
                            decoration: const InputDecoration(hintText: "Write anything")
                          ),
                          ),
                          RawMaterialButton(
                            onPressed: () async{
                              if(entry.isEmpty) return;
                              await My_shared_pref.addString(entry);
                              entry="";
                              Navigator.pushNamedAndRemoveUntil(context, Page_Routes.home, (route) => false);
                            },
                            shape: const CircleBorder(),
                            fillColor: Colors.grey,
                            child: const Icon(Icons.add),
                            )
      ],))
  ])));
  }
}
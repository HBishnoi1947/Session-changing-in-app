import 'package:session/session_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class My_shared_pref{
  static const total = "total";
  static const data = "data";


  static fetchData()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    List<String> a = _prefs.getStringList(data)?? [];
    print(a);
    int i=0;
    List<Session> s=[];
    List<String> b=[];
    while(i<a.length){
      b.add(a[i]);
      if(b.length==Session.entryPerSession){
        s.add(Session(b));
        b=[];
      }
      i=i+1;
    }
    if(b.isNotEmpty) s.add(Session(b));
    return s;
  }

  static addString(String s)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List <String> a = prefs.getStringList(data)?? [];
    a.add(s);
    await prefs.setStringList(data, a);
  }
}
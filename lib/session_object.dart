class Session{
  late List<String> entries;
  static int entryPerSession = 5;
  Session(List<String> s){
    entries = s;
  }
  Session.makeNew(){
    entries = [];
  }
  addEntry(String s){
    entries.add(s);
  }
}
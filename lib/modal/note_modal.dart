class NoteModal{
  String? title;
  String? desc;

  NoteModal({required this.title,required this.desc});


  factory NoteModal.fromdocs(Map<String,dynamic> docs){
    return NoteModal(
        title: docs["title"],
        desc: docs["desc"]);
  }


  Map<String,dynamic> toDocs(){
    return {
      "title":title,
      "desc" :desc
    };
  }


}
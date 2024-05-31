class SigninModal{
  String name;
  SigninModal({required this.name});

  factory SigninModal.tofrom(Map<String,dynamic> doc){
    return SigninModal(name: doc["name"]);
  }

  Map<String,dynamic> todoc(){
    return{
      "name":name
    };
  }

}


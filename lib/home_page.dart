import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_first/login_page.dart';
import 'package:firebase_practice_first/modal/note_modal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference mUsers;

  var titlecontroller=TextEditingController();
  var desccontroller=TextEditingController();
  String? muid;

  @override
  void initState() {
    super.initState();
    getuidlog();
  }

getuidlog() async {
    var prefs=await SharedPreferences.getInstance();
    muid=prefs.getString(LoginPage.S_Key);
}


  @override
  Widget build(BuildContext context) {
    mUsers=firestore.collection("user").doc(muid).collection("notes");
    return Scaffold(
      appBar:AppBar(
        title: Text("Firebase notes App"),
        actions: [
          IconButton(onPressed: (){


            setState(() {
              logOut();
            });



          }, icon:Icon(Icons.logout)),

        ],
      ),
      body: muid!=null ? FutureBuilder(
        future:firestore.collection("user").doc(muid).collection("notes").get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError){
            return Text("error${snapshot.error}");
          }else if(snapshot.hasData){
            return ListView.builder(
                itemCount:snapshot.data!.size,
                itemBuilder: (context,index){
             Map<String,dynamic> Data=snapshot.data!.docs[index].data();
             var mData=NoteModal.fromdocs(Data);

              return InkWell(
                onTap: (){
                  showModalBottomSheet(context: context, builder:(context){
                    titlecontroller.text=mData.title.toString();
                    desccontroller.text=mData.desc.toString();
                    return bottomBar(isUpdated: true,upindex:snapshot.data!.docs[index].id);
                  });

                },
                child: ListTile(
                  leading: Text("${index+1}"),
                  title: Text(mData.title!),
                  subtitle: Text(mData.desc!),
                  trailing: IconButton(onPressed: (){
                      mUsers.doc(snapshot.data!.docs[index].id).delete().then((value){
                        setState(() {

                        });

                      },onError: (e){
                        print("error${e}");
                      }
                      );


                  },icon: Icon(Icons.delete),),
                ),
              );
            });
          }
          return Container(
            color: Colors.red.shade500,
          );
        },
      ):Center(child: Text("no Notes avlaible")),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder:(context){
            titlecontroller.clear();
            desccontroller.clear();
            return bottomBar();
          });



        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget bottomBar({bool isUpdated = false, String? upindex}){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(isUpdated ? "Update Note": 'Add Note',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Enter Title Name',style: TextStyle(
                    fontWeight: FontWeight.w700
                ),),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Enter Subtitle',style: TextStyle(
                    fontWeight: FontWeight.w700
                )),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: desccontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  //var userid=widget.uid;



                    if(isUpdated!=true){
                      var  newUser=NoteModal(title:titlecontroller.text.toString(),
                          desc:desccontroller.text.toString());

                    mUsers.add(newUser.toDocs()).then((value){
                      setState(() {

                      });
                      Navigator.pop(context);

                    },onError: (e){
                      print("Error: $e");
                    });


                  }else{
                      var  updateUser=NoteModal(title:titlecontroller.text.toString(),
                          desc:desccontroller.text.toString());
                      mUsers.doc(upindex).update(updateUser.toDocs()).then((value){

                        Navigator.pop(context);
                        setState(() {

                        });


                      },onError: (e){
                        print("Error: $e");
                      });;



                    }



                }, child:Text(isUpdated ? "Update Note" : 'Add Note')),
                ElevatedButton(onPressed: (){}, child:Text('Cancel ')),
              ],
            )
          ],
        ),
      ),
    );
  }

  logOut() async {
    var prefs=await SharedPreferences.getInstance();
    prefs.setString(LoginPage.S_Key,"");
  }


}

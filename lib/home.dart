import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_notes/add.dart';
import 'package:diary_notes/update.dart';
import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';

class home extends StatefulWidget {
   home({super.key});
       CollectionReference diary=FirebaseFirestore.instance.collection('diary');
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // initState(){
  // widget.diary= FirebaseFirestore.instance.collection('diary');
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
  final width=MediaQuery.of(context).size.width;
  // print(width);
    return Scaffold(
      appBar: AppBar(title: Text(DateTime.now().toString().split(' ')[0]),centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: 
      // SafeArea(
      //   child:GridView.count(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     padding: const EdgeInsets.all(20),
      //     // children: List.generate(, (index) => null),
      //   ) ,
      // ),
      StreamBuilder(
        stream: (widget.diary).snapshots(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            // print('${snapshot.hasData} hqhqhqw ${snapshot.data!.docs.length}');
            return ListView.builder(
              itemBuilder: (context, index){
                final DocumentSnapshot diarySnap = snapshot.data!.docs[index];
                return
          //       return GridView.count(
          // crossAxisCount: 2,
          // mainAxisSpacing: 10,
          // crossAxisSpacing: 10,
          // padding: const EdgeInsets.all(20),
          // children:
          //  List.generate(//10,
          //   snapshot.data!.docs.length,
          //  (index) =>
            // Flexible(
                // Wrap(
                //   children: [
              // child: 
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(       
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                 border:Border.all(color: Colors.blue),
                 color: Colors.white,
                 boxShadow: [
                  BoxShadow(
                 color: const Color.fromARGB(255, 168, 160, 160),
                 blurRadius: 10,
                 spreadRadius: 15
              
                  )
              
                 ]
                 ),
                height: 88,
                width: 40,
                child:
                 Row(
                   children: [
                     InkWell(
                      
                       child: Container(
                        width: width-102,
                        height: 100,
                         child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                       
                            // Padding(
                            //          padding:  EdgeInsets.only(right:(width/3)-20),
                              // child:
                               Text(//'Hi how are you '//,overflow: TextOverflow.ellipsis
                                diarySnap['Heading']
                                ,style: TextStyle(fontSize: 26.3,fontWeight: FontWeight.bold),),
                            // ),
                            ],),
                            SizedBox(height: 7,),
                            // Text(diarySnap['Description'])
                            // ReadMore
                            Text(
                              diarySnap['Description'],
                              // '''I am fine how are dsjfkkjljfdksssssssssssssssssssssssssssssssssssssssssssskfs;ajiewarsjikojksdsnjosa''',
                              overflow: TextOverflow.ellipsis,maxLines: 2,
                              )
                              
                            //   trimLines: 2,
                            //   trimMode: TrimMode.Line,
                            //   trimCollapsedText: '...Read more',
                            //   trimExpandedText: ' .Less',
                            // ),
                          ],
                                     ),
                       ),
                                   onTap: (){
                                    
                                    popup(context, diarySnap['Heading'], diarySnap['Description']);
                                    // Navigator.of(context).push(popup(context, h, d));
                                   },
                     ),
                        Wrap(
                          // spacing: 1,
                          // runSpacing: 1,
                          children: [
                     Container(
                      height: 140,
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                                   
                                  //  SizedBox(height: 20,),
                                  //  Padding(
                                  //    padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),//EdgeInsets.only(left:8.0,right: 8.0,top: 0),
                                  //  child:
                                  //  Container(
                                        // height: 10,
                                    //  child:
                                      Padding(
                                       padding: const EdgeInsets.only(top:5.0),
                                       child: 
                                       
                                       Container(

                                        //  height: 1,
                                          // constraints: BoxConstraints.tight(Size.fromWidth(30)),
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.cyan
                                        ),
                                         child: IconButton(
                                          icon:Icon(Icons.edit,color: Colors.black,
                                          ),
                                         onPressed: (){
                                        print('editing ${diarySnap.id}');
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                          updating(H:  diarySnap['Heading'] ,D:  diarySnap['Description'], id: diarySnap.id)
                                        ));
                                                           
                                         },
                                         ),
                                       ),
                                     ),
                                  //  ),
                                   Container(
                                    // height: 1,
                                     child: Padding(
                                       padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                       child: IconButton(
                                        // padding: EdgeInsets.all(0),
                                        // constraints: BoxConstraints.tight(Size.fromWidth(30,)),
                                        icon:Icon(Icons.delete,color: Colors.red,size: 25,),
                                       onPressed: (){
                                        print('deleting ${diarySnap.id}');
                                                   widget.diary.doc(diarySnap.id).delete();    
                                                       
                                       },
                                       
                                       ),
                                     ),
                                   ),
                                    //  ),
                                  //    onPressed: (){
                             
                                  //    },
                                     
                                  //  )
                        
                            ],
                          ),
                     ),
                      ],
                     )
                   ],
                 ),
                         ),
              );
            //       ]
            // )
        //     ),
        // ) ;
              }, 
              itemCount: snapshot.data!.docs.length,
              );
          }
              return Container(
                child: Text('Soryy No elements found'),
              );
        }
        ),
    floatingActionButton: FloatingActionButton(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> adding()));
    },
    child: Icon(Icons.add),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  Future<void> popup(BuildContext context,String h,String d)async{
    showDialog(
      context: context,
       builder: (context){
        return SimpleDialog(
          title: Text(h),
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(d),
            ),
            Padding(padding: EdgeInsets.all(10),
        child:CloseButton(
          onPressed:(){
            Navigator.of(context).pop();
          }
        )
        ),
          ],
        );
       });
  }
}
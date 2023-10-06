import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class adding extends StatelessWidget {
  adding({super.key});
    final CollectionReference diary=FirebaseFirestore.instance.collection('diary');
    TextEditingController Heading=TextEditingController();
    TextEditingController Detail=TextEditingController(); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Notes'),),
      body: SafeArea(
        
        child:Padding(
          padding: EdgeInsets.all(20),
        child:Column(
          children: [
            TextField(
              controller: Heading,
              decoration: InputDecoration(
                border:OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                label: Text('Heading'),
                hintText: 'Enter the Heading',
                helperText: 'Enter the focusing point or important point'
              ),
            )    ,
            SizedBox(height: 5,),
                        TextFormField(
                          controller: Detail,
              decoration: InputDecoration(
                border:OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                // label: Text('Detailed note'),
                hintText: 'Content',
                helperText: 'Enter the Note in detail '
              ),
                maxLines:4,
                maxLength: 500,
            )    ,
            TextButton(onPressed: (){
              final data={'Heading':Heading.text.trim(),'Description':Detail.text.trim(),'Time':DateTime.now().toString()};
              diary.add(data);
              Heading.text='';
              Detail.text='';
            }, child: Text('Submit'),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))),)
          ],
        ) ,
          )
        ),
    );
  }
}
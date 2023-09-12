import 'package:flutter/material.dart';

class StudentList extends StatefulWidget{
  var c,s,d,t;
  @override
  StudentList(this.c,this.s,this.d,this.t);
  State<StatefulWidget> createState() => StudentListState(c,s,d,t);
}


class StudentListState extends State<StudentList>{
  var c,s,d,t;
  StudentListState(this.c,this.s,this.d,this.t);

  var students = [["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P'],["B001","John Doe",70022100001,'P']];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List"),),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // color: Colors.blue,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 0.7)
                  ),
                  height: 120,
                  child:  Column(
                    children: [
                      Expanded(
                        child: Text("Course: $c"),
                      ),
                      Expanded(
                        child: Text("Subject: $s"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text("Date: $d"),
                          ),
                          Container(
                            child: Text("Time: $t"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(itemBuilder: (context,index){
                    return ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 0.7),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Text((students[index][0]).toString(),style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                      title: Text((students[index][1]).toString(),style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                      subtitle: Text((students[index][2]).toString()),
                      trailing:SizedBox(
                        width: 60,
                        height: 60,

                        child: ElevatedButton(
                          onPressed: (){
                            if(students[index][3]=="P"){
                              students[index][3]="A";
                              setState(() {

                              });
                            }

                            else if(students[index][3]=="A"){
                              students[index][3]="P";
                              setState(() {

                              });
                            }
                          },

                          child: Text((students[index][3]).toString(),style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),),


                          style: ElevatedButton.styleFrom(
                            elevation: 7,
                            backgroundColor: students[index][3]=="P"? Colors.green:Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    );

                  },
                      separatorBuilder: (context,index){
                        return Divider(thickness: 1,height: 40,);
                      },
                      itemCount: students.length),
                ),
              ],
            )
        ),
      ),
    );
  }

}



import 'package:flutter/material.dart';
import 'summarystudent.dart';
import 'tabularstudent.dart';
import 'dart:convert';


class StudentAttendance extends StatefulWidget {
  const StudentAttendance({super.key});

  @override
 State<StatefulWidget> createState() => StudentAState();
  }

class StudentAState extends State<StudentAttendance>{

  void navigatetosummary(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return Summary2();
    }));

  }

  void navigatetotabular(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return Tabularstudent();
    }));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text("Attendance"),
        ),
        body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:EdgeInsets.all(30),
                  child:SizedBox(
                    width: 200,
                    height: 100,
                    child: ElevatedButton(onPressed: (){
                      print("Summary Data Pressed!");
                      navigatetosummary(context);
                    }
                      , child: Text("Summary Data",textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),),
                      style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ) ,
                    ),
                  ),
                ),

                Container(
                  margin:EdgeInsets.all(30),
                  child:SizedBox(
                    width: 200,
                    height: 100,
                    child: ElevatedButton(onPressed: (){
                      print("Tabular data pressed!");
                      navigatetotabular(context);
                    }
                      , child: Text("Tabular data",textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),
                  ),
                ),
              ],
            )
        )

    );
  }
}
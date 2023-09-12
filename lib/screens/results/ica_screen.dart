
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ICAScreen extends StatefulWidget {
  @override
State<StatefulWidget> createState() => ICAPageState();

}

class ICAPageState extends State<ICAScreen> {
  var details =[["Mobile Application Development", 45, "PASS", "true"],["Calculus", 21, "FAIL", "true"], ["Operating Systems", 39, "PASS", "true"], ["Software Engineering", 42, "PASS", "true"], ["Quantum and Statistical Physics", 12, "FAIL", "true"], ["Computer Networks",30, "PASS", "true"]];
  var marks = [[2023, "Semester 5", 10, 9, 26] , [2022, "Semester 3", 7, 5, 9], [2022, "Semester 4", 8, 9, 22],[2021, "Semester 2", 9, 9, 24], [2021, "Semester 2", 2, 3, 7], [2023, "Semester 5", 7, 9, 14]];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text("ICA Marks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          backgroundColor: Colors.red,

        ),

        body:Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: screenWidth,

                decoration: BoxDecoration(
                    color: Color.fromRGBO(231, 126, 132, 0.7),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(CupertinoIcons.search),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 17, 30, 0),
                      child: SizedBox(
                          width: screenWidth -150,
                          height:screenHeight-600,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              hintText: 'Search',
                              fillColor: Colors.white,
                              filled: true,

                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(Icons.filter_alt),
                    )
                  ],

                ),
              ),
            ),
            Expanded(child:
            ListView.builder(itemBuilder: (context, index){

              var detMarks = details[index][1];
              var sem = marks[index][1];
              var yr = marks[index][0];
              var m1 = marks[index][2];
              var m2 = marks[index][3];
              var tw = marks[index][4];

              bool vis = details[index][3].toString().toLowerCase() != "false";

              Color textColor = details[index][2]=="PASS" ? Colors.green : Colors.red;
              Color boxColor = details[index][2]=="PASS" ? CupertinoColors.systemGrey6: Color.fromRGBO(250, 227, 229, 1);
              //  Color.fromRGBO(230, 252, 234, 1) for Green 232, 235, 234
              return SingleChildScrollView(

                child:
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Visibility(
                        // visible: vis,
                        // if(details[index][3])
                        // visible: bool.fromEnvironment(details[index][3].toString()),
                        visible: details[index][3].toString()== "true" ? true:false,

                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: SizedBox(
                            height: 100,
                            child: OutlinedButton(

                                style: OutlinedButton.styleFrom(
                                    backgroundColor: CupertinoColors.systemGrey5,
                                    elevation: 7,
                                    shadowColor: Colors.grey,
                                    side: BorderSide(color: Colors.red, width: 1),
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                                ),
                                onPressed: (){
                                  if(details[index][3].toString()=="true"){

                                    details[index][3]="false";
                                    print(details[index][3]);
                                    setState(() {

                                    });
                                  }
                                  else if(details[index][3].toString()=="false"){

                                    details[index][3]="true";
                                    print(details[index][3]);
                                    setState(() {

                                    });
                                  }

                                  print(details[index][3]);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(details[index][0].toString(), style: TextStyle(fontSize: 20, color: Colors.red),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Marks: $detMarks", style: TextStyle(fontSize: 18, color: Colors.black, ),),
                                        Text(details[index][2].toString(), style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w900),)
                                      ],
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: details[index][3].toString()=="false"?true:false,
                          child: Container(

                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: OutlinedButton(

                              onPressed: (){
                                details[index][3]="true";
                                setState(() {

                                });
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                backgroundColor: boxColor,
                                elevation: 12,
                                shadowColor: Colors.grey,
                                side: BorderSide(color: Colors.red, width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(details[index][0].toString(), style: TextStyle(fontSize: 20, color: Colors.red,fontWeight: FontWeight.w700, overflow: TextOverflow.fade),),
                                  ),
                                  Text("$sem", style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),),
                                  Text("Year: $yr", style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text("M-1 Marks: $m1/10", style: TextStyle(color: Colors.black, fontSize: 15),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                        child: Text("M-2 Marks: $m2/10", style: TextStyle(color: Colors.black, fontSize: 15),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Term Work: $tw/30", style: TextStyle(color: Colors.black,  fontSize: 15),),
                                      Text("Total Marks: $detMarks/50", style: TextStyle(color: Colors.black,  fontSize: 15, fontWeight: FontWeight.w900),)
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(details[index][2].toString(), style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w900),),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),

              );

            }, itemCount: details.length,),
            ),


          ],
        )


    );
  }
}
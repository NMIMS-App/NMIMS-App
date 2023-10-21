import 'package:flutter/material.dart';
import 'package:nmims_app/models/summary_attendance_item_model.dart';
class Summary2 extends StatelessWidget{
  const Summary2 ({Key ? key}): super (key:key);

  @override
  Widget build(BuildContext context) {
    // List<List<Object>> arrnames=[['supervisory control and data acquisition',3,2],['Mobile Application Development',5,5],['Computer Networks',2,0],['Artificial Intelligence',6,3],['Image and Video Processing',4,4],['Operating Systems',7,6],['Probability and Statistics',6,6]];
    // for (int i=0;i<arrnames.length;i++){
    //   int j=int.parse((arrnames[i][1]).toString());
    //   int k=int.parse((arrnames[i][2]).toString());
    //   double p= double.parse((k*100/j).toStringAsFixed(1));
    //   if((p*10)%10==0){
    //     arrnames[i].add(p.toInt());
    //   }
    //   else {
    //     arrnames[i].add(p);
    //   }
    // }
    return Scaffold(
        appBar: AppBar(title: Text("Summary Data"),),
        body: Center(
            child:Container(
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //     margin: EdgeInsets.only(top: 20,bottom: 20),
                        //     decoration: BoxDecoration(
                        //         color:Color.fromRGBO(113,113,112,1),
                        //         borderRadius: BorderRadius.all(Radius.circular(8))
                        //     ),
                        //     width:((MediaQuery. of(context). size. width)/4.31),
                        //     height:80,
                        //     child:Center(
                        //         child:Text('Subject', textAlign: TextAlign.center,style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.w600,
                        //         ),))
                        // ),
                        Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(113,113,112,1),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            width:((MediaQuery. of(context). size. width)/5),
                            height:80,
                            child:Align(
                                alignment: Alignment.center,
                                child:Text('Total Lectures', textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),))
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            decoration: BoxDecoration(
                                color:Color.fromRGBO(113,113,112,1),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            width:((MediaQuery. of(context). size. width)/5),
                            height:80,
                            child:Center(
                                child:Text('Lectures Attended', textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),))
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(113,113,112,1),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            width:((MediaQuery. of(context). size. width)/5),
                            height:80,
                            child:Center(
                                child:Text('Percent', textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),))
                        ),

                      ],
                    ),
                    Flexible(
                        child: Container(
                            height: MediaQuery.of(context).size.height,
                            child:ListView.separated(itemBuilder: (context,index){
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: ((MediaQuery.of(context).size.height)/20)+90+5,
                                child: Column(
                                  children: [
                                    Container(
                                        width:MediaQuery.of(context).size.width,
                                        height: (MediaQuery.of(context).size.height)/20,
                                        // color: Colors.white,
                                        child:Text(attendance[index].subject, textAlign: TextAlign.center,style: TextStyle(
                                          color:Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),)
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Container(
                                          // // color:Colors.blue,
                                          // margin: EdgeInsets.only(top: 15,bottom: 15),
                                          // width:((MediaQuery. of(context). size. width)/4.31),
                                          // height:90,
                                          // child:Align(
                                          // alignment: Alignment.center,
                                          // child:Text((arrnames[index][0]).toString(), textAlign: TextAlign.center,style: TextStyle(
                                          // color:Colors.black,
                                          // fontSize: 16,
                                          // fontWeight: FontWeight.w600,
                                          // ),))
                                          // ),
                                          Container(
                                              width:((MediaQuery. of(context). size. width)/5),
                                              // color:Colors.blue,
                                              height:80,
                                              child:Center(
                                                  child:Container(
                                                      width:70,
                                                      height:70,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.white70,
                                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                                        border: Border.all(color: Color.fromRGBO(155,0,0,1),width: 2.5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            spreadRadius: -0.1,
                                                            blurRadius: 6.0,
                                                          ),],
                                                      ),
                                                      child:Center(
                                                          child:Text((attendance[index].totallecs).toString(), textAlign: TextAlign.center,style: TextStyle(
                                                            color:Colors.black,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w400,
                                                          ),))


                                                  )
                                              )

                                          ),
                                          Container(
                                              width:((MediaQuery. of(context). size. width)/5),
                                              height:80,
                                              // color:Colors.blue,
                                              child:Center(
                                                  child:Container(
                                                      width:70,
                                                      height:70,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                                        border: Border.all(color: Colors.red,width: 2.5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                          ),
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            spreadRadius: -0.1,
                                                            blurRadius: 6.0,
                                                          ),],
                                                      ),
                                                      child:Center(
                                                          child:Text((attendance[index].presentlecs).toString(), textAlign: TextAlign.center,style: TextStyle(
                                                            color:Colors.black,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w400,
                                                          ),)

                                                      )
                                                  )
                                              )
                                          ),

                                          Container(
                                              width:((MediaQuery. of(context). size. width)/5),
                                              height:80,
                                              // color:Colors.blue,

                                              child:Center(
                                                  child:Container(
                                                      width:70,
                                                      height:70,
                                                      decoration: BoxDecoration(
                                                        color: (double.parse((attendance[index].presentlecs*100/attendance[index].totallecs).toString())) >= 80.0 ? Colors.transparent: Colors.red,
                                                        border: (double.parse((attendance[index].presentlecs*100/attendance[index].totallecs).toString())) >= 80.0 ? Border.all(color: Colors.black,width: 2.5):Border.all(color: Colors.red,width: 2.5),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black,
                                                          ),
                                                          BoxShadow(
                                                            color:(double.parse((attendance[index].presentlecs*100/attendance[index].totallecs).toString())) >= 80.0 ? Colors.white : Colors.red,
                                                            spreadRadius: -0.1,
                                                            blurRadius: 5.0,
                                                          ),],
                                                        borderRadius: BorderRadius.all(Radius.circular(25)),

                                                      ),
                                                      child:Center(
                                                          child:Text((attendance[index].presentlecs*100/attendance[index].totallecs).toStringAsFixed(1), textAlign: TextAlign.center,style: TextStyle(
                                                            color: (double.parse((attendance[index].presentlecs*100/attendance[index].totallecs).toString())) >= 80.0 ?Colors.black:Colors.white,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w500,
                                                          ),)
                                                      )
                                                  )
                                              )
                                          )
                                        ]
                                    ),
                                  ],
                                ),
                              );


                            },
                              itemCount: (attendance.length),
                              separatorBuilder: (context,index){
                                return Divider(thickness: 1,);
                              },
                            )
                        ))

                  ],
                )

            )
        )
    );
  }}

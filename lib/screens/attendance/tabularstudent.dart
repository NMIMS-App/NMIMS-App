import 'package:flutter/material.dart';
import 'package:nmims_app/models/tabular_attendance_item_model.dart';
class Tabularstudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Tabularstudentstate();
}

class Tabularstudentstate extends State<Tabularstudent>{

  var startdate = 'Start Date';
  var enddate = 'End Date';


  bool isvisible=false;

  // var tabular=[['Mobile Application Development ','05/05/2023','11:00 am - 12:00 pm','P'],['Software Engineering','12/05/2023','10:00 am - 11:00 am','A'],['Artificial Intelligence','24/06/2023','09:00 am - 10:00 am','P'],['Deep Learning','30/07/2023','11:00 am - 12:00 pm','P'],['Image and Video Processing','03/08/2023','01:00 pm - 02:00 pm','P'],['Cryptography','12/09/2023','09:00 am - 10:00 am','A']];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tabular Data'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(right:10,top: 5,bottom: 5),
                width:((MediaQuery. of(context). size. width)/2)-20,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('From: ${startdate}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16)),
                    IconButton(onPressed: ()async{
                      DateTime? datepicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023,5),
                          lastDate: DateTime(2023,11));

                      if(datepicked!=null){
                        startdate = "${datepicked.day}/${datepicked.month}/${datepicked.year}";
                        setState(() {
                        });
                      }
                      if(startdate!='Start Date' && enddate!='End Date'){
                        isvisible=true;
                        setState(() {

                        });
                      }
                    },
                      icon: Icon( Icons.calendar_today_outlined,size: 35, color: Colors.white,),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:10,top: 5,bottom: 5),
                width:((MediaQuery. of(context). size. width)/2)-20,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('To:  ${enddate}',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),),
                    IconButton(onPressed: ()async{
                      DateTime? datepicked2 = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023,5),
                          lastDate: DateTime(2023,11));

                      if(datepicked2!=null){
                        enddate = "${datepicked2.day}/${datepicked2.month}/${datepicked2.year}";
                        setState(() {

                        });
                      }
                      if(startdate!='Start Date' && enddate!='End Date'){
                        isvisible=true;
                        setState(() {

                        });
                      }
                    },
                      icon: Icon( Icons.calendar_today_outlined,size:35,color: Colors.white, ),)
                  ],
                ),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //     margin: EdgeInsets.only(top: 20,bottom: 20),
              //     decoration: BoxDecoration(
              //          color:Color.fromRGBO(113,113,112,1),
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
                  width:((MediaQuery. of(context). size. width)/4.5),
                  height:80,
                  child:Align(
                      alignment: Alignment.center,
                      child:Text('Date', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  // decoration: BoxDecoration(
                  //   // color:Color.fromRGBO(113,113,112,1),
                  //     color: Color.fromRGBO(211,211,211,1),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black45,
                  //         blurRadius: 8.0, // soften the shadow
                  //         spreadRadius: 0.1, //extend the shadow
                  //
                  //       )
                  //     ],
                  //     borderRadius: BorderRadius.all(Radius.circular(8))
                  // ),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(113,113,112,1),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  width:((MediaQuery. of(context). size. width)/4.5),
                  height:80,
                  child:Center(
                      child:Text('Time', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(211,211,211,1),
                  //   borderRadius: BorderRadius.all(Radius.circular(8)),
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.black45,
                  //       blurRadius: 8.0, // soften the shadow
                  //       spreadRadius: 0.1, //extend the shadow
                  //
                  //     )
                  //   ],
                  // ),
                  decoration: BoxDecoration(
                      color:Color.fromRGBO(113,113,112,1),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  width:((MediaQuery. of(context). size. width)/5),
                  height:80,
                  child:Center(
                      child:Text('P / A', textAlign: TextAlign.center,style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),))
              ),
            ],
          ),

          Visibility(
              visible: isvisible,
              child:Flexible(
                child: Center(
                  child: Container(
                    height:MediaQuery.of(context).size.height,
                    child: ListView.separated(itemBuilder: (context,index){
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: ((MediaQuery.of(context).size.height)/20)+8+75,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top:15),
                              width: MediaQuery.of(context).size.width,
                              height: (MediaQuery.of(context).size.height)/20,
                              child:Text((t_attendance[index].subject), textAlign: TextAlign.center,style: TextStyle(
                                color:Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                // // color:Colors.blue,
                                // margin: EdgeInsets.only(top: 8),
                                // width:((MediaQuery. of(context). size. width)/4.31),
                                // height:90,
                                // child:Align(
                                // alignment: Alignment.center,
                                // child:Text((tabular[index][0]).toString(), textAlign: TextAlign.center,style: TextStyle(
                                // color:Colors.black,
                                // fontSize: 16,
                                // fontWeight: FontWeight.w600,
                                // ),))
                                // ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/4.5),
                                  //margin: EdgeInsets.only(top:15),
                                  height:50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black38,width: 1.4),
                                  ),
                                  child: Center(
                                    child:Text("${t_attendance[index].date.day}/${t_attendance[index].date.month}/${t_attendance[index].date.year}",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/4.5),
                                  height:50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black38,width: 1.4),
                                  ),
                                  child: Center(
                                    child:Text(t_attendance[index].time.toString(),style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),textAlign: TextAlign.center,),
                                  ),
                                ),

                                Container(
                                  width:((MediaQuery. of(context). size. width)/5),
                                  height:50,
                                  child: Center(
                                      child: Container(
                                          width: ((MediaQuery. of(context). size. width)/7),
                                          height:50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            border: Border.all(color: t_attendance[index].pa=='P'?Colors.black:Colors.red ,width: 3.5),
                                          ),
                                          child: Center(
                                            child:Text(t_attendance[index].pa,style: TextStyle(
                                              color: t_attendance[index].pa=='P'? Colors.black : Colors.red,
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          )
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                      itemCount: t_attendance.length,
                      separatorBuilder: (context,index){
                        return Divider(thickness: 1);
                      },
                    ),
                  ),
                ),
              )
          ),

        ],
      ),

    );
  }

}































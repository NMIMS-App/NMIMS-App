import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nmims_app/screens/results/ica_screen.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: 90,
          title: Text("Exams", style: (TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: SizedBox(
                  height: 130,
                  width: 300,
                  child: ElevatedButton(
                      onPressed:(){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> ICAScreen(),));
                      },

                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Colors.red,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                      child: Text("ICA Marks", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.red,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    onPressed: (){print("TEE");},
                    child: Text("TEE Marks", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),)
                ),
              )
            ],
          ),
        )
    );
  }

}
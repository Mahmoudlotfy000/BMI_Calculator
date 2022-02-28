import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mahmoud_app/screens/bmi/result.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = true;
  double  height = 150;
  int weight = 55;
  int age= 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculater'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                         isMale =true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale? Colors.blue: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_tree_sharp,size: 70,),
                            SizedBox(height: 20,),
                            Text('MALE',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.grey[400] :Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_tree_sharp,size: 70,),
                            SizedBox(height: 20,),
                            Text('FEMALE',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HIEGHT',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',style: TextStyle(fontSize: 80,fontWeight: FontWeight.w900),),
                        Text('cm',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged:(value){
                          setState(() {
                            height = value;
                          });

                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          Text('$weight',style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'w-',
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    weight --;
                                  });
                                },
                              child: Icon(Icons.remove),),
                              FloatingActionButton(
                                heroTag: 'w+',
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    weight ++;
                                  });
                                },
                              child: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          Text('$age',style: TextStyle(fontSize: 60,fontWeight: FontWeight.w900),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'a-',
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    age --;
                                  });
                                },
                              child: Icon(Icons.remove),),
                              FloatingActionButton(
                                heroTag: 'a+',
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    age ++;
                                  });
                                },
                              child: Icon(Icons.add),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
            onPressed: () {
              double result = weight / pow( height /100 , 2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(builder:(context) => BMI_Result(
                age: age,
                isMale: isMale,
                result: result.round(),
              )));
            },
            child: Text('CALCULATE',style: TextStyle(color: Colors.white,fontSize: 20),),
          )),
        ],
      ),
    );
  }
}

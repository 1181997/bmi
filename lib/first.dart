
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  var wtcontroller=TextEditingController();
  var htcontroller=TextEditingController();
  var incontroller=TextEditingController();

  var result="";

  var bgcolor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Your BMI"),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700),),

                SizedBox(height: 21),

                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(label: Text("Enter Your Weight In KGs"),
                      prefixIcon: Icon(Icons.line_weight),border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),

                TextField(
                  controller: htcontroller,
                  decoration: InputDecoration(label: Text("Enter Your Height In Feet"),
                      prefixIcon: Icon(Icons.height),border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)) ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 11),

                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(label: Text("Enter Your Height In Inch"),
                      prefixIcon: Icon(Icons.height),border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 21),

                ElevatedButton(onPressed: (){
                  var wt=wtcontroller.text.toString();
                  var ht=htcontroller.text.toString();
                  var inch=incontroller.text.toString();

                  if(wt!="" && ht!="" && inch!="") {
                    //BMI Calculation
                    var iwt = int.parse(wt);
                    var iht = int.parse(ht);
                    var iinch = int.parse(inch);

                    var tinch= (iht*12)+iinch;
                    var tcm= tinch*2.54;
                    var tm= tcm/100;

                    var bmi = iwt/(tm*tm);

                    var msg="";

                    if(bmi>=25)
                      {
                       msg="You Are Overweight!!";
                       bgcolor=Colors.redAccent;

                      }
                    else if(bmi<=18)
                    {
                      msg="You are underweight!!";
                      bgcolor=Colors.orange;

                    }else
                      {
                        msg="Congratulations, You are healthy!!";
                        bgcolor=Colors.green;
                      }

                    setState(() {
                      result="$msg \n Your Bmi Is: ${bmi.toStringAsFixed(2)}";
                    });
                  }
                  else
                    {
                      setState(() {
                        result= "Please Fill All The Required Details!!!";
                      });
                    }

                }, child: Text("Calculate")),

                SizedBox(height: 25),

                Text(result,style: TextStyle(fontSize: 25),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

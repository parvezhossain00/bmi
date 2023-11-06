
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {

  Color myColor = Colors.transparent;
  TextEditingController weight_Controller = new TextEditingController();
  TextEditingController height_Controller = new TextEditingController();
  var main_result = TextEditingController();

  CalCulate_BMI (String weight,String height) async{
    var mydoubleWeight = double.parse(weight);
    assert(mydoubleWeight is double);
    var mydoubleHeight = double.parse(height);
    assert(mydoubleHeight is double);

    var res = (mydoubleWeight/(mydoubleHeight*mydoubleHeight));

    setState(() {
      main_result.text = res.toStringAsFixed(2);
      if(res<18.5){
        myColor = const Color(0xFF87B1D9);
      }
      else if(res>=18.5 && res<=24.9){
        myColor = const Color(0xFF3DD365);
      }
      else if(res>=25 && res<=29.9){
        myColor = const Color(0xFFEEE133);
      }
      else if(res>=30 && res<=34.9){
        myColor = const Color(0xFFFD802E);
      }
      else if(res>=35){
        myColor = const Color(0xFFF95353);
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF6DD5ED),
                      Color(0xFF2193B0)
                    ]
                )
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text("BMI Calculator",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF0038FF),fontSize: 25),),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
                    child: TextField(
                      controller: weight_Controller,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18,color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your weight (kg)",
                      ),
                    ),),
                  Padding(padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: TextField(
                      controller: height_Controller,
                      autofocus: false,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(fontSize: 18,color: Colors.black),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your height (m)",
                      ),
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            CalCulate_BMI(weight_Controller.text, height_Controller.text);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(const Color(0xFF0038FF)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  )
                              )
                          ),
                          child: const Text("Calculate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                          color: myColor,
                          borderRadius: const BorderRadius.all(Radius.circular(12))
                      ),
                      child: Center(child: Text("BMI: "+main_result.text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF87B1D9),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          const Text("Underweight",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF3DD365),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          const Text("Normal",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFFEEE133),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          const Text("Overweight",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFD802E),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          const Text("obese",style: TextStyle(fontSize: 15),)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF95353),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                          ),
                          const Text("Extreme",style: TextStyle(fontSize: 15),)
                        ],
                      )
                    ],
                  ),)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

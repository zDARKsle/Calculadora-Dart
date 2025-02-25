import 'dart:math';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

final TextEditingController _controllerNum1 = TextEditingController();
final TextEditingController _controllerNum2 = TextEditingController();
String _textoResultado = "";
  String _operacao = "";

  void _calcular() {
    double? num1 = double.tryParse(_controllerNum1.text);
    double? num2 = double.tryParse(_controllerNum2.text);
    double? res;    

    if (num1 == null || num2 == null) {
      setState(() {
        _textoResultado =
            "null";
      });
    } else if (_operacao == "+") {
      res = num1 + num2;
    } else if (_operacao == "–") {
      res = num1 - num2;
    } else if (_operacao == "×") {
      res = num1 * num2;
    } else if (_operacao == "÷") {
      res = num1 / num2;
    } else if (_operacao == "^") {
      res = pow(num1,num2) as double?;
    } else if (_operacao == "√") {
      res = pow(num1,1/num2) as double?; 
    }

          setState(() {
        _textoResultado = res.toString();
        _controllerNum1.clear();
        _controllerNum2.clear();
        _operacao = "";
      });}
  
  @override
  Widget build(BuildContext context) {
    var textoResultado = _textoResultado;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora", style: TextStyle( color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 163, 4, 226),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 32),
                ), 
              ),
              Container(
        width: 1500,
        height:75,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                   
                  child: Text(
                    textoResultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
                            const Padding(
                padding: EdgeInsets.only(top: 20),         
              ),

              Wrap(
                alignment: WrapAlignment.spaceAround,
                spacing:300,
                children: [ SizedBox(
                  width:300,
                  child:
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Número - Dividendo / Base"),
                      
                      style: const TextStyle(fontSize: 25),
                      controller: _controllerNum1,
                    ),
                ),
      
                SizedBox(child: Text(_operacao, style: const TextStyle(fontSize:50, color: Color.fromARGB(255, 163, 4, 226))),),
                
                SizedBox(
                  width:300,
                    child: 
                      TextField(
                        
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                        alignLabelWithHint: true,
                          labelText: "Número - Divisor / Índice"),
                          
                        style: const TextStyle(fontSize: 25),
                        controller: _controllerNum2,
                      ),
                    
                  )],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),         
              ),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.spaceAround,
                children: [
                  
              RawMaterialButton(
              onPressed: () {
                 setState(() {
                _operacao = "+";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("+", style: TextStyle(fontSize:50, color: Colors.white)),
            ),
      
            RawMaterialButton(
              onPressed: () {
                setState(() {
                _operacao = "–";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("–", style: TextStyle(fontSize:50, color: Colors.white)),
            ),
      
            RawMaterialButton(
              onPressed: () {
                setState(() {
                _operacao = "×";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("×", style: TextStyle(fontSize:50, color: Colors.white)),
            ),
              RawMaterialButton(
              onPressed: () {
                setState(() {
                _operacao = "÷";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("÷", style: TextStyle(fontSize:50, color: Colors.white)),
            ),
      
            RawMaterialButton(
              onPressed: () {
                setState(() {
                _operacao = "^";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("^", style: TextStyle(fontSize:50, color: Colors.white)),
            ),
      
            RawMaterialButton(
              onPressed: () { 
                setState(() {
                _operacao = "√";
                });
              },
             elevation: 1.0,
              fillColor: const Color.fromARGB(255, 163, 4, 226),
             padding: const EdgeInsets.all(10.0),
            shape: const CircleBorder(),
             child: const Text("√", style: TextStyle(fontSize:50, color: Colors.white)),
            )
              ],),
                    const Padding(
                padding: EdgeInsets.only(top: 50),         
              ),

      
          Container(
            width: 200.0,
            height: 50.0, 
            
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 163, 4, 226),

),

              onPressed: () {
                _calcular();
              },
             child: const Text("Calcular", style: TextStyle(fontSize:25, color: Colors.white)),
            ),
          ),

          ],
        ),
      ),
    );
  }
 }
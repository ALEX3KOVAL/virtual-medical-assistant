import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../menuScreen/menuScreen.dart';

class PatientsDiagnosesScreen extends StatelessWidget {
  const PatientsDiagnosesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(backgroundColor: Colors.blue, body:Stack(children: [
          Image.asset("assets/img.png",height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,),
          WillPopScope(onWillPop: () async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const MenuScreen()));
            return false;
          },
              child:Stack(children: [Padding(
                  padding: const EdgeInsets.only(left:130.0, top: 45.0),
                  child: Text("Диагнозы", style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.purple, letterSpacing: 1.2, fontWeight: FontWeight.normal))),
                Stack(children: [
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:105.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Пациент 1', textAlign: TextAlign.center, style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:136.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('ФИО: Иванов Иван Иванович', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:167.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Дата рождения: 22.02.1988', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:198.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Дата обследования: 12.12.2021', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:229.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Микобактерии (б/мл): 1200', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:260.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Температура тела: 38.2', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:291.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Лимфоциты (%): 32', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:322.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Лейкоциты (к/пз): 15', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:353.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Инфицирование (%): 47.951', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),



                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:425.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Пациент 2', textAlign: TextAlign.center, style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:456.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('ФИО: Власов Владислав Владиславович', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:487.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Дата рождения: 22.02.1988', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:518.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Дата обследования: 12.12.2021', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:549.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Микобактерии (б/мл): 2589', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:580.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Температура тела: 37.1', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:611.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Лимфоциты (%): 12', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:642.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Лейкоциты (к/пз): 3', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                  Container(
                    width: 360,
                    margin: const EdgeInsets.only(top:673.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: Text('Инфицирование (%): 56.357', style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal),),
                  ),
                ])]))
        ]))
    );
  }
}
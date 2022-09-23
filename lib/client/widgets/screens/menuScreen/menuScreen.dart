import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/routes.dart';
import '../patientsAnalyzesScreen/patientsAnalyzesScreen.dart';
import '../patientsDiagnosesScreen/patientsDiagnosesScreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
          children: <Widget> [
            Image.asset("assets/img.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover
            ),
            MaterialApp(
                debugShowCheckedModeBanner: false,
                home:
                Scaffold(
                    backgroundColor: Colors.transparent,
                    body:
                    Center(
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color.fromRGBO(248, 177, 149, 1.0),
                                  minimumSize: const Size(50,40),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      side: const BorderSide(color: Colors.purple)
                                  )
                              ),
                              onPressed: () => Navigator.of(context).push(createRoute(const PatientsAnalyzesScreen())),
                              child:
                              Text("Анализы пациентов",
                                  style: GoogleFonts.montserrat(fontSize: 17, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal)
                              ),
                            ),
                            const SizedBox(height: 85),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromRGBO(248, 177, 149, 1.0),
                                    minimumSize: const Size(50,40),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                      side: const BorderSide(color: Colors.purple),)
                                ),
                                onPressed: () => Navigator.of(context).push(createRoute(const PatientsDiagnosesScreen())),
                                child: Text("Результаты анализов", style: GoogleFonts.montserrat(fontSize: 16, color: Colors.blue, letterSpacing: 1.2, fontWeight: FontWeight.normal))
                            ),
                          ],
                        )
                    )
                )
            )
          ]
      )
    );
  }
}
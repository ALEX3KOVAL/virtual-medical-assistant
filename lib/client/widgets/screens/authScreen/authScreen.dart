import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_dialogue_system/client/routes/routes.dart';
import '../menuScreen/menuScreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          Image.asset("assets/img.png",height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(backgroundColor: Colors.transparent,
                floatingActionButton: Center(child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 28.0, bottom:20.0),
                          child: Text("АВТОРИЗАЦИЯ", style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.normal),)
                      )
                      ,Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 30),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue),
                          decoration: const InputDecoration(
                            labelText: 'введите свой логин',
                          ),
                        ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 50),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.blue)
                          ,obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'введите свой пароль',
                          ),
                        ),),
                      Padding(
                          padding: const EdgeInsets.only(left: 27.0, bottom: 20.0),
                          child: SizedBox(height: 80, width: 65,child: IconButton(
                            icon: Image.asset("assets/auth_button.png", fit: BoxFit.fill),
                            onPressed: () => Navigator.of(context).pushReplacement(createRoute(const MenuScreen()))),
                          )
                          )
                   ]
                )
                )
          )
        ]
    )
    );
  }
}
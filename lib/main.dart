import 'package:e_commerce/splash/splash_screen.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: SplashScreen.routeName,
  routes: {
    SplashScreen.routeName :(context)=>SplashScreen(),
    RegisterScreen.routeName :(context)=>RegisterScreen(),
    LoginScreen.routeName:(context)=>LoginScreen()
  },
);
  }
}
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/main_screen.dart';
import 'package:legallyai/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var keyForm = GlobalKey<FormState>();

  var emailCtrl = TextEditingController();

  var passwordCtrl = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, 
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 105,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'))      
                      ),
                    ),
                  ),
                  const Gap(25),
                  Text("Welcome back to LEGALLY AI!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32
                    ),
                  ),
                  const Gap(17),
                  Text("Please login to your credentials",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
                  ),
                  const Gap(17),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: setTextDecoration('Email'),
                    controller: emailCtrl,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                            return "*Email is required.";
                          }
                          if(!EmailValidator.validate(value)){
                            return "*Invalid email address.";
                          }
                    },
                  ),
                  const Gap(15),
                  TextFormField(
                    obscureText: hidePassword,
                    decoration: setTextDecoration('Password', isPasswordFieldTrue: true),
                    controller: passwordCtrl,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                            return "*Password is required.";
                          }
                    },
                  ),
                  const Gap(40),
                   Container(
                      width: 380,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6B6399), Color(0xFFB2A5FF)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if(!keyForm.currentState!.validate()){
                            return;
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            
                          ),
                      ),
                      TextButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterScreen()));
                      }, child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF493D9E)
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  setTextDecoration(String label, {isPasswordFieldTrue = false}) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Color(0xFFF4F4F6), // Border color when not focused
          width: 1,
        ),
      ) ,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey, // Border color when focused
          width: 2,
        ),
      ),
      label: Text(label),
      filled: true,
      fillColor: Color(0xFFF4F4F6),
      suffixIcon: isPasswordFieldTrue ? IconButton(
        onPressed: toogleShowPassword,
        icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility)) : null,
        
      );
  }

  void toogleShowPassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}
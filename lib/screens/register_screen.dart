import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var keyForm = GlobalKey<FormState>();

  var emailCtrl = TextEditingController();
  var fnameCtrl = TextEditingController();
  var lnameCtrl= TextEditingController();
  var confirmPassCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  bool hidePassword = true;
  bool isAgree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: keyForm,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
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
                Text("Join LEGALLY AI!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32
                  ),
                ),
                const Gap(20),
                Text("Start simplifying legal complexities today.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                const Gap(15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: setTextDecoration('First Name'),
                  controller: fnameCtrl,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                          return "*First name is required.";
                        }
                        
                  },
                ),
                const Gap(15),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: setTextDecoration('Last Name'),
                  controller: lnameCtrl,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                          return "*Last name is required.";
                        }
                        
                  },
                ),
                const Gap(15),
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
                const Gap(15),
                TextFormField(
                  obscureText: hidePassword,
                  decoration: setTextDecoration('Retype Password', isPasswordFieldTrue: true),
                  controller: confirmPassCtrl,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                          return "*Password is required.";
                          
                      }
                      if(passwordCtrl.text != confirmPassCtrl.text){
                        return "*Password do not match";
                      }
                      
                  },
                ),
                Row(           
                  children:[ 
                      Checkbox(value: isAgree, onChanged: (value){
                      isAgree = value!;
                      setState(() {
                        
                      });
                    }),
                    Text(
                        "I understand and agree to the",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "LegallyAI terms of service including User Agreement and Privacy Policy.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF493D9E),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines:3,
                     
                        ),
                      ),
                  
                  ]
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                        "Sign up",
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
                    Text("Already have an account?",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          
                        ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                    }, child: Text(
                      "Login",
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
    );
  }

  setTextDecoration(String label, {isPasswordFieldTrue = false}) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Color(0xFFF4F4F6), 
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
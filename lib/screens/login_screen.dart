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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Dark background from theme
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 105,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                    ),
                  ),
                  const Gap(25),
                  Text(
                    "Welcome back to LEGALLY AI!",
                    style: Theme.of(context).textTheme.titleLarge, // Large title from theme
                  ),
                  const Gap(17),
                  Text(
                    "Please login to your credentials",
                    style: Theme.of(context).textTheme.bodyMedium, // Body text from theme
                  ),
                  const Gap(17),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: setTextDecoration('Email'),
                    controller: emailCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "*Email is required.";
                      }
                      if (!EmailValidator.validate(value)) {
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
                      if (value == null || value.isEmpty) {
                        return "*Password is required.";
                      }
                    },
                  ),
                  const Gap(40),
                  // Refined button using the elevatedButtonTheme
                  ElevatedButton(
                    onPressed: () {
                      if (!keyForm.currentState!.validate()) {
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
                    child: Text("Login"),
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyMedium, // Text style from theme
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor, // Accent color for register link
                          ),
                        ),
                      ),
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
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).dividerColor, // Divider color from theme
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor, // Focus color from theme
          width: 2,
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(color: Colors.white70), // Label text from theme
      filled: true,
      fillColor: Theme.of(context).inputDecorationTheme.fillColor, // Background color from theme
      suffixIcon: isPasswordFieldTrue
          ? IconButton(
              onPressed: toggleShowPassword,
              icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
            )
          : null,
    );
  }

  void toggleShowPassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }
}

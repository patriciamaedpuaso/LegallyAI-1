import 'package:flutter/material.dart';
import 'package:legallyai/screens/chatbot_screens/main_chatbot.dart';
import 'package:legallyai/screens/document_screens/document_summarize_screen.dart';
import 'package:legallyai/screens/document_screens/scanning.dart';
import 'package:legallyai/screens/document_screens/document.dart';
import 'package:legallyai/screens/login_screen.dart';
import 'package:legallyai/screens/main_screen.dart';
import 'package:legallyai/screens/template_screens/templates.dart';

void main(){
  runApp(LegallyAIApp());
}

class LegallyAIApp extends StatelessWidget {
  const LegallyAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
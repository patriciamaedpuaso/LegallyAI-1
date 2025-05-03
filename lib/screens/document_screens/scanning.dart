import 'package:flutter/material.dart';
import 'package:legallyai/screens/document_screens/chatbot_screen.dart';
import 'package:legallyai/screens/document_screens/document_summarize_screen.dart';

class OCRScannerScreen extends StatelessWidget {
  const OCRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double frameSize = MediaQuery.of(context).size.width * 0.75;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DocumentSummarizeScreen()));
          },
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/scanning.gif',
                    fit: BoxFit.cover,
                    width: 321,
                    height: 477,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40),
                child: Text(
                  "Please take a moment while we are scanning your document...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

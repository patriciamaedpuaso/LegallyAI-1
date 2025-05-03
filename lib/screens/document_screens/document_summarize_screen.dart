import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/document_screens/chatbot_screen.dart';

class DocumentSummarizeScreen extends StatelessWidget {
  DocumentSummarizeScreen({super.key});

  final List texts = ['Summary Highlights', 'Key Clauses', 'Actionable Insights'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Document Summary"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF5F5F5),
              ),
              margin: const EdgeInsets.only(bottom: 20), 
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(12), 
                    Image.asset(
                      'assets/images/resultDoc.png',
                      fit: BoxFit.cover, 
                      width: double.infinity, 
                      height: 180,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatbotScreen()));
        },
        backgroundColor: const Color(0xFF8e84cc),
        child: ClipOval(
          child: Image.asset(
            'assets/icons/chatbot.png',
            width: 28, 
            height: 28, 
            fit: BoxFit.cover,
          ),
        ),
        shape: const CircleBorder(),
      ),
    );
  }
}

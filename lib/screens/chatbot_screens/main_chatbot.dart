import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final List<String> texts = [
    'Review Legal Documents\n(Upload documents to get summaries, key points, and important highlights.)',
    'Answer Your Legal Questions\n(Ask about legal terms, contracts, or clauses — I’ll explain them in simple terms.)',
    'Compare Documents\n(Spot differences between legal documents and identify changes easily.)'
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "Legally AI",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Gap(30),
            // Icon
            SizedBox(
              height: 142,
              width: 146,
              child: Image.asset('assets/images/TestIcon.png'),
            ),

            const Gap(10),

            // Title
            const Text(
              "Capabilities",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFFB8B8C3),
              ),
            ),

            const Gap(20),

            // Capabilities List inside scrollable section
            Expanded(
              child: ListView.builder(
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        texts[index],
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),

            const Gap(16),

            // Message before input
            const Text(
              "These are just a few examples of what I can do.",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),

            const Gap(10),

            // Message form
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ask me anything...',
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Material(
                  color: const Color(0xFF8E84CC),
                  shape: const CircleBorder(),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Handle send action
                    },
                  ),
                )
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    ),
  );
}

}

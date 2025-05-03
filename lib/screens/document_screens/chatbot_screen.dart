import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text("Document Summary"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
          
            children: [
              // 1) Expanded area for chat bubbles
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Chatbot message
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              color: const Color(0xFF8e84cc),
                              width: 49,
                              height: 49,
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/chatbot.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                          ),
                          const Gap(12),
                          Flexible(
                            child: Container(
                              width: 254,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7E7E7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "What would you like to know about this document?",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Gap(20),

                      // User message
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Container(
                              width: 130,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7E7E7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Explain clause 5",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Gap(20),

                      // Chatbot image response
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              color: const Color(0xFF8e84cc),
                              width: 49,
                              height: 49,
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/chatbot.png',
                                  width: 28,
                                  height: 28,
                                ),
                              ),
                            ),
                          ),
                          const Gap(12),
                          Flexible(
                            child: Container(
                              width: 254,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7E7E7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                'assets/images/chatDoc.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(20),

              // 2) Fixed input row
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Ask me anything...',
                        fillColor: const Color(0xFFE7E7E7),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  Material(
                    color: const Color(0xFF8e84cc),
                    shape: const CircleBorder(),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        // TODO: Implement send logic
                        print('Send: ${_controller.text}');
                        _controller.clear();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

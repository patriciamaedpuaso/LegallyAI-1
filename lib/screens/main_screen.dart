import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:legallyai/screens/chatbot_screens/main_chatbot.dart';
import 'package:legallyai/screens/document_screens/scanning.dart';
import 'package:legallyai/screens/template_screens/templates.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<String> texts = ['Chatbot', 'Review', 'Templates', 'Others'];
  final List<String> icons = [
    'assets/icons/chatbot.png',
    'assets/icons/review.png',
    'assets/icons/templates.png',
    'assets/icons/others.png'
  ];
  final List<String> textFiles = ['Business Contract', 'Employment Contract', 'Business Contract'];
  final List<Color> colorsDocs = [Colors.amber, Colors.blue, Colors.green];
  final List colorsbf = [Colors.amber[200], Colors.blue[200], Colors.green[200]];
  final List linksScreen = [ChatbotScreen(), OCRScannerScreen(), TemplatesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 40,
      ),
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Container(
              height: 41,
              width: 41,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB2A5FF),
              ),
              padding: const EdgeInsets.all(5),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
            iconSize: 50,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> linksScreen[index]));
                          },
                          child: Container(
                            width: 80,
                            height: 71,
                            decoration: BoxDecoration(
                              color: const Color(0xFF8e84cc),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Image.asset(
                                icons[index],
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          texts[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500, 
                            
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Gap(1),
            Row(
              children: [
                SizedBox(width: 12,),
                Text("Recent Files",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ],
            ),
            const Gap(10),
            Container(
              height: 360,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 20, 
                    mainAxisSpacing: 15, 
                  ),
                  itemCount: 4, 
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD0D8DC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(9),
                            Image.asset(
                              'assets/images/docs.png',
                              width: 100,
                              height: 100,
                              
                            ),
                            Text("Document 1",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF5E5E5E)),),
                            Text("Created at: 02-23-25",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF5E5E5E)),
                            )
                          ],
                        ),
                      )
                    );
                  },
                ),
              ),
            ),
            
            Row(
              children: [
                SizedBox(width: 12,),
                Text("Sample Templates",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 53,
                            width: 55,
                            color: colorsbf[index],
                            child: Icon(Icons.file_copy,
                              color:colorsDocs[index],
                            ),
                          ),
                          const Gap(20),
                          Text(textFiles[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              ),
            )
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OCRScannerScreen()));
        },
        backgroundColor: const Color(0xFF8e84cc),
        child: const Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.white,
        ),
        shape: const CircleBorder(),
      ),
    );
    
    
  }
}

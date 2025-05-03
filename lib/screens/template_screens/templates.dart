import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TemplatesScreen extends StatelessWidget {
  TemplatesScreen({super.key});

  final List<String> dates = ["Yesterday", "2 days ago", "2 days ago"];
  final List<String> titles = ["Lease Agreements", "Employment Contracts", "Lease Agreements"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Template Library"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recent files",
                  style: TextStyle(fontSize: 14, color: Color(0xFF868686)),
                ),
                const Text(
                  "Continue",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const  Gap(12),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: titles.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: 117,
                        height: 107,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD0D8DC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(8),
                            Image.asset(
                              'assets/images/docs.png',
                              width: 97,
                              height: 60,
                            ),
                            
                            Text(
                              titles[index],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              dates[index],
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5E5E5E),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Gap(12),
                const Text(
                  "Templates",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const Gap(12),
                _templateSection("Contracts and Agreements", [
                  "Sales Contract", "Partnership Agreement", "Service Agreement", "MOA"
                ]),
                const Gap(12),
                _templateSection("Property and Real Estate Documents", [
                  "Deed of Sale", "Land Title", "Mortgage Agreement", "Lease Form"
                ]),
                const Gap(12),
                _templateSection("Legal Proceedings and Court Documents", [
                  "Complaint", "Summons", "Affidavit", "Court Order"
                ]),
                const Gap(12),
                _templateSection("Financial and Banking Documents", [
                  "Promissory Note", "Loan Agreement", "Bank Guarantee", "Check Template"
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _templateSection(String title, List<String> items) {
    final List<IconData> iconOptions = [
      Icons.insert_drive_file,
      Icons.file_copy,
      Icons.picture_as_pdf,
      Icons.folder,
    ];

    final List<Color> colorOptions = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(8),
        SizedBox(
          height: 74,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (_, index) {
              return Container(
                width: 106,
                height: 74,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD0D8DC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       SizedBox(
                          width: 26,
                          height: 31,
                          child: Icon(
                            iconOptions[index % iconOptions.length],
                            color: colorOptions[index % colorOptions.length],
                            size: 20, // You can adjust this for a better fit
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/docs.png', width: 47, height: 33),
                      ],
                    ),
                    const Gap(6),
                    Text(
                      items[index],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

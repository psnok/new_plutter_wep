import 'package:flutter/material.dart';

void main() {
  runApp(const CustomerCenterApp());
}

class CustomerCenterApp extends StatelessWidget {
  const CustomerCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '고객센터',
      home: CustomerCenterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomerCenterPage extends StatefulWidget {
  @override
  State<CustomerCenterPage> createState() => _CustomerCenterPageState();
}

class _CustomerCenterPageState extends State<CustomerCenterPage> {
  int selectedTab = 0; // 0: 공지사항, 1: 업데이트

  final List<Map<String, String>> notices = [
    {'number': '216', 'title': '웹겜페이먼츠 시스템작업', 'date': '2025.05.15'},
    {'number': '211', 'title': '겨울철 안전 수칙', 'date': '2024.12.12'},
    {'number': '208', 'title': '결빙 주의 요망', 'date': '2024.11.29'},
    {'number': '207', 'title': '241106잡지 기사 업데이트', 'date': '2024.11.06'},
    {'number': '206', 'title': '출금제한 긴급공지', 'date': '2024.11.01'},
    {'number': '205', 'title': '픽업완료업데이트', 'date': '2024.09.23'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 900,
          margin: const EdgeInsets.symmetric(vertical: 40),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '고객센터',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.home_outlined, size: 18, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    'Home > 고객센터 > 공지사항',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => setState(() => selectedTab = 0),
                      style: TextButton.styleFrom(
                        backgroundColor: selectedTab == 0
                            ? Colors.blue[700]
                            : Colors.grey[200],
                        foregroundColor: selectedTab == 0
                            ? Colors.white
                            : Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text('공지사항', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => setState(() => selectedTab = 1),
                      style: TextButton.styleFrom(
                        backgroundColor: selectedTab == 1
                            ? Colors.blue[700]
                            : Colors.grey[200],
                        foregroundColor: selectedTab == 1
                            ? Colors.white
                            : Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text('업데이트', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '새로운 소식을 알려드립니다.',
                  style: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
              ),
              const SizedBox(height: 10),
              Table(
                columnWidths: const {
                  0: FixedColumnWidth(70),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(120),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                  bottom: BorderSide(color: Colors.grey[400]!, width: 2),
                ),
                children: [
                  // Table Header
                  const TableRow(
                    decoration: BoxDecoration(color: Color(0xfff6f6f6)),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '번호',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '제목',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          '등록일',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // Table Content
                  ...notices.map(
                    (row) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            row['number']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            row['title']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            row['date']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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

import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Dummy data for cards
  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'Total Questions',
      'value': '150',
      'icon': 'help_outline',
      'color': Colors.blue,
    },
    {
      'title': 'Answered',
      'value': '120',
      'icon': 'check_circle_outline',
      'color': Colors.green,
    },
    {
      'title': 'Pending',
      'value': '30',
      'icon': 'pending',
      'color': Colors.orange,
    },
    {
      'title': 'Priority',
      'value': '8',
      'icon': 'priority_high',
      'color': Colors.red,
    },
  ];

  // Dummy data for pending questions
  final List<Map<String, dynamic>> pendingQuestions = [
    {
      'id': '001',
      'question': 'How to implement authentication in Flutter?',
      'category': 'Flutter Development',
      'priority': 'High',
      'date': '2024-01-15',
      'user': 'John Doe'
    },
    {
      'id': '002',
      'question': 'Best practices for state management in React?',
      'category': 'React Development',
      'priority': 'Medium',
      'date': '2024-01-14',
      'user': 'Sarah Smith'
    },
    {
      'id': '003',
      'question': 'How to optimize database queries for large datasets?',
      'category': 'Database',
      'priority': 'High',
      'date': '2024-01-14',
      'user': 'Mike Johnson'
    },
    {
      'id': '004',
      'question': 'What are the latest trends in UI/UX design?',
      'category': 'Design',
      'priority': 'Low',
      'date': '2024-01-13',
      'user': 'Emily Davis'
    },
    {
      'id': '005',
      'question': 'How to implement CI/CD pipeline with GitHub Actions?',
      'category': 'DevOps',
      'priority': 'Medium',
      'date': '2024-01-13',
      'user': 'Alex Wilson'
    },
    {
      'id': '006',
      'question': 'Best security practices for web applications?',
      'category': 'Security',
      'priority': 'High',
      'date': '2024-01-12',
      'user': 'Chris Brown'
    },
    {
      'id': '007',
      'question': 'How to handle large file uploads efficiently?',
      'category': 'Backend',
      'priority': 'Medium',
      'date': '2024-01-12',
      'user': 'Lisa Anderson'
    },
    {
      'id': '008',
      'question': 'What are microservices and when to use them?',
      'category': 'Architecture',
      'priority': 'Low',
      'date': '2024-01-11',
      'user': 'David Lee'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Dashboard',
          style: TextStyle(
            fontSize: screenWidth * 0.055,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A1A),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              size: screenWidth * 0.06,
              color: const Color(0xFF666666),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.04),
            child: CircleAvatar(
              radius: screenWidth * 0.045,
              backgroundColor: const Color(0xFF6C63FF),
              child: Text(
                'AD',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF5A52D5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, Admin!',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    'Here\'s what\'s happening with your questions today.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.025),

            // Stats Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.03,
                mainAxisSpacing: screenWidth * 0.03,
                childAspectRatio: 1.4,
              ),
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                final card = cardData[index];
                return Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            decoration: BoxDecoration(
                              color: card['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Icon(
                              _getIconData(card['icon']),
                              color: card['color'],
                              size: screenWidth * 0.06,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card['value'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            card['title'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: const Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: screenHeight * 0.03),

            // Pending Questions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pending Questions',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: const Color(0xFF6C63FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.015),

            // Pending Questions List (Scrollable)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ListView.separated(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  itemCount: pendingQuestions.length,
                  separatorBuilder: (context, index) => Divider(
                    height: screenHeight * 0.025,
                    color: const Color(0xFFE5E5E5),
                  ),
                  itemBuilder: (context, index) {
                    final question = pendingQuestions[index];
                    return InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01,
                          horizontal: screenWidth * 0.02,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Priority Indicator
                            Container(
                              width: screenWidth * 0.08,
                              height: screenWidth * 0.08,
                              decoration: BoxDecoration(
                                color: _getPriorityColor(question['priority']).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _getPriorityIcon(question['priority']),
                                size: screenWidth * 0.04,
                                color: _getPriorityColor(question['priority']),
                              ),
                            ),
                            
                            SizedBox(width: screenWidth * 0.03),
                            
                            // Question Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    question['question'],
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.038,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1A1A1A),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.02,
                                          vertical: screenHeight * 0.003,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF6C63FF).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(screenWidth * 0.01),
                                        ),
                                        child: Text(
                                          question['category'],
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.03,
                                            color: const Color(0xFF6C63FF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.02,
                                          vertical: screenHeight * 0.003,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _getPriorityColor(question['priority']).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(screenWidth * 0.01),
                                        ),
                                        child: Text(
                                          question['priority'],
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.03,
                                            color: _getPriorityColor(question['priority']),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        size: screenWidth * 0.035,
                                        color: const Color(0xFF999999),
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Text(
                                        question['user'],
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.032,
                                          color: const Color(0xFF999999),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.03),
                                      Icon(
                                        Icons.access_time,
                                        size: screenWidth * 0.035,
                                        color: const Color(0xFF999999),
                                      ),
                                      SizedBox(width: screenWidth * 0.01),
                                      Text(
                                        question['date'],
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.032,
                                          color: const Color(0xFF999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            // Action Button
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: screenWidth * 0.035,
                                color: const Color(0xFF999999),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'help_outline':
        return Icons.help_outline;
      case 'check_circle_outline':
        return Icons.check_circle_outline;
      case 'pending':
        return Icons.pending;
      case 'priority_high':
        return Icons.priority_high;
      default:
        return Icons.help_outline;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return const Color(0xFFFF4757);
      case 'medium':
        return const Color(0xFFFF9F43);
      case 'low':
        return const Color(0xFF2ED573);
      default:
        return const Color(0xFF999999);
    }
  }

  IconData _getPriorityIcon(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Icons.keyboard_double_arrow_up;
      case 'medium':
        return Icons.keyboard_arrow_up;
      case 'low':
        return Icons.keyboard_arrow_down;
      default:
        return Icons.help_outline;
    }
  }
}
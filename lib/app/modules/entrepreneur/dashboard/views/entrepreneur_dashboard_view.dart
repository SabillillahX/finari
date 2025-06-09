import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/utils/auto_responsive.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../shared/navbar.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/entrepreneur_dashboard_controller.dart';

class EntrepreneurDashboardView extends GetView<EntrepreneurDashboardController> {
  const EntrepreneurDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return WillPopScope(
      // Exit dialog
      onWillPop: () => DialogUtils.showExitDialog(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(responsive.wp(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Avatar, Name and Notification
                  _buildHeader(responsive),

                  SizedBox(height: responsive.hp(2)),

                  // Financial Cards (for entrepreneur: Dana Terkumpul & Target Pendanaan)
                  _buildFinancialCards(responsive),

                  SizedBox(height: responsive.hp(3)),

                  // Statistics Charts
                  _buildStatisticsCharts(responsive),

                  SizedBox(height: responsive.hp(3)),

                  // Project/Campaign Management
                  _buildProjectManagement(responsive),

                  SizedBox(height: responsive.hp(3)),

                  // Recent Funding
                  _buildRecentFunding(responsive),

                  // Add some bottom padding for scrolling
                  SizedBox(height: responsive.hp(10)),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomNavBar(
          role: 'entrepreneur',
          selectedIndex: 0, // Dashboard tab selected
          onTap: (index) {
            switch (index) {
              case 0:
                // Dashboard - Already here
                break;
              case 1:
                // Campaigns
                Get.snackbar(
                  'Info',
                  'Campaigns page will be implemented soon',
                  snackPosition: SnackPosition.BOTTOM,
                );
                break;
              case 2:
                // Profile
                Get.toNamed(Routes.PROFILE);
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeader(AutoResponsive responsive) {
    return Row(
      children: [
        CircleAvatar(
          radius: responsive.wp(6),
          backgroundImage: NetworkImage(
            'https://ui-avatars.com/api/?name=Entrepreneur&background=FF6B35&color=fff',
          ),
        ),
        SizedBox(width: responsive.wp(3)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat datang,',
                style: TextStyle(
                  fontSize: responsive.sp(12),
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'John Entrepreneur',
                style: TextStyle(
                  fontSize: responsive.sp(16),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF011936),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(responsive.wp(2)),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(responsive.wp(2)),
          ),
          child: Icon(
            Icons.notifications_none,
            size: responsive.wp(6),
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialCards(AutoResponsive responsive) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(responsive.wp(4)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(responsive.wp(3)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF4CAF50).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: responsive.wp(6),
                ),
                SizedBox(height: responsive.hp(1)),
                Text(
                  'Dana Terkumpul',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: responsive.sp(12),
                  ),
                ),
                Text(
                  'Rp 125.000.000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.sp(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: responsive.wp(3)),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(responsive.wp(4)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(responsive.wp(3)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF2196F3).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.flag,
                  color: Colors.white,
                  size: responsive.wp(6),
                ),
                SizedBox(height: responsive.hp(1)),
                Text(
                  'Target Pendanaan',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: responsive.sp(12),
                  ),
                ),
                Text(
                  'Rp 500.000.000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: responsive.sp(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatisticsCharts(AutoResponsive responsive) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.wp(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress Pendanaan',
            style: TextStyle(
              fontSize: responsive.sp(16),
              fontWeight: FontWeight.bold,
              color: Color(0xFF011936),
            ),
          ),
          SizedBox(height: responsive.hp(2)),
          Container(
            height: responsive.hp(25),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 5),
                      FlSpot(2, 4),
                      FlSpot(3, 7),
                      FlSpot(4, 6),
                      FlSpot(5, 8),
                    ],
                    isCurved: true,
                    color: Color(0xFF4CAF50),
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Color(0xFF4CAF50).withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectManagement(AutoResponsive responsive) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.wp(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kelola Proyek',
                style: TextStyle(
                  fontSize: responsive.sp(16),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF011936),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Lihat Semua'),
              ),
            ],
          ),
          SizedBox(height: responsive.hp(2)),
          ...List.generate(3, (index) {
            final projects = [
              {'title': 'Tech Startup MVP', 'progress': 75, 'target': 'Rp 200M'},
              {'title': 'Green Energy Project', 'progress': 45, 'target': 'Rp 150M'},
              {'title': 'E-commerce Platform', 'progress': 90, 'target': 'Rp 100M'},
            ];
            
            return Container(
              margin: EdgeInsets.only(bottom: responsive.hp(1.5)),
              padding: EdgeInsets.all(responsive.wp(3)),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(responsive.wp(2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        projects[index]['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: responsive.sp(14),
                        ),
                      ),
                      Text(
                        '${projects[index]['progress']}%',
                        style: TextStyle(
                          color: Color(0xFF4CAF50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsive.hp(0.5)),
                  Text(
                    'Target: ${projects[index]['target']}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: responsive.sp(12),
                    ),
                  ),
                  SizedBox(height: responsive.hp(1)),
                  LinearProgressIndicator(
                    value: (projects[index]['progress'] as int) / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRecentFunding(AutoResponsive responsive) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.wp(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pendanaan Terbaru',
            style: TextStyle(
              fontSize: responsive.sp(16),
              fontWeight: FontWeight.bold,
              color: Color(0xFF011936),
            ),
          ),
          SizedBox(height: responsive.hp(2)),
          ...List.generate(4, (index) {
            final fundings = [
              {'investor': 'Ahmad Investor', 'amount': 'Rp 25.000.000', 'date': '2 jam lalu'},
              {'investor': 'Sarah Capital', 'amount': 'Rp 50.000.000', 'date': '5 jam lalu'},
              {'investor': 'Budi Venture', 'amount': 'Rp 15.000.000', 'date': '1 hari lalu'},
              {'investor': 'Lisa Fund', 'amount': 'Rp 30.000.000', 'date': '2 hari lalu'},
            ];
            
            return Container(
              margin: EdgeInsets.only(bottom: responsive.hp(1.5)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: responsive.wp(4),
                    backgroundImage: NetworkImage(
                      'https://ui-avatars.com/api/?name=${fundings[index]['investor']}&background=random',
                    ),
                  ),
                  SizedBox(width: responsive.wp(3)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fundings[index]['investor'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: responsive.sp(14),
                          ),
                        ),
                        Text(
                          fundings[index]['date'] as String,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: responsive.sp(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    fundings[index]['amount'] as String,
                    style: TextStyle(
                      color: Color(0xFF4CAF50),
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.sp(14),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/auto_responsive.dart';
import '../../../../core/utils/exit_dialog.dart';
import '../../../../widgets/home/navbar.dart';
import '../controllers/investor_dashboard_controller.dart';

class InvestorDashboardView extends GetView<InvestorDashboardController> {
  const InvestorDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return WillPopScope(
      // Exit dialog
      onWillPop: () => showExitConfirmationDialog(context),
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

                  // Financial Cards (for investor: Total Investasi & Imbal Hasil)
                  _buildFinancialCards(responsive),

                  SizedBox(height: responsive.hp(3)),

                  // Statistics Charts (for investor)
                  _buildStatisticsCharts(responsive),

                  SizedBox(height: responsive.hp(3)),

                  // Transaction History (for investor)
                  _buildTransactionHistory(responsive),

                  SizedBox(height: responsive.hp(10)),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavBar(),
      ),
    );
  }

  Widget _buildHeader(AutoResponsive responsive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: responsive.wp(6),
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=Investor&background=0D8ABC&color=fff',
              ),
            ),
            SizedBox(width: responsive.wp(3)),
            Column(
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
                  'Investor',
                  style: TextStyle(
                    fontSize: responsive.sp(16),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF011936),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(responsive.wp(5)),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_outlined, color: Color(0xFF011936)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialCards(AutoResponsive responsive) {
    return Row(
      children: [
        // Total Investasi Card
        Expanded(
          child: _buildFinancialCard(
            responsive,
            title: 'Total Investasi',
            amount: 'Rp 50.000.000',
            icon: Icons.account_balance_wallet,
            color: Colors.blue[100]!,
          ),
        ),
        SizedBox(width: responsive.wp(3)),
        // Imbal Hasil Card
        Expanded(
          child: _buildFinancialCard(
            responsive,
            title: 'Imbal Hasil',
            amount: 'Rp 7.500.000',
            icon: Icons.trending_up,
            color: Colors.green[100]!,
          ),
        ),
      ],
    );
  }

  Widget _buildFinancialCard(
    AutoResponsive responsive, {
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.wp(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(responsive.wp(2)),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(responsive.wp(2)),
            ),
            child: Icon(icon, color: Color(0xFF011936)),
          ),
          SizedBox(height: responsive.hp(1)),
          Text(
            amount,
            style: TextStyle(
              fontSize: responsive.sp(16),
              fontWeight: FontWeight.bold,
              color: Color(0xFF011936),
            ),
          ),
          SizedBox(height: responsive.hp(0.5)),
          Text(
            title,
            style: TextStyle(
              fontSize: responsive.sp(12),
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsCharts(AutoResponsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistik Investasi',
          style: TextStyle(
            fontSize: responsive.sp(18),
            fontWeight: FontWeight.bold,
            color: Color(0xFF011936),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        _buildChart(responsive, 'Performa Investasi', true),
      ],
    );
  }

  Widget _buildChart(AutoResponsive responsive, String title, bool hasData) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsive.wp(3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: responsive.sp(14),
              fontWeight: FontWeight.bold,
              color: Color(0xFF011936),
            ),
          ),
          SizedBox(height: responsive.hp(2)),
          hasData
              ? SizedBox(
                  height: responsive.hp(20),
                  child: Placeholder(), // Ganti dengan LineChart jika ingin
                )
              : Container(
                  height: responsive.hp(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Data Tidak Tersedia',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: responsive.sp(14),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildTransactionHistory(AutoResponsive responsive) {
    List<Map<String, dynamic>> transactions = [
      {
        'type': 'Investasi Masuk',
        'date': '12 Mei 2025',
        'amount': 10000000,
        'isPositive': false,
        'icon': Icons.arrow_upward,
      },
      {
        'type': 'Imbal Hasil',
        'date': '10 Mei 2025',
        'amount': 1500000,
        'isPositive': true,
        'icon': Icons.arrow_downward,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Riwayat Investasi',
              style: TextStyle(
                fontSize: responsive.sp(18),
                fontWeight: FontWeight.bold,
                color: Color(0xFF011936),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Lihat Semua',
                style: TextStyle(
                  fontSize: responsive.sp(12),
                  color: Color(0xFF011936),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: responsive.hp(1)),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(responsive.wp(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => Divider(height: 1),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(4),
                  vertical: responsive.hp(0.5),
                ),
                leading: Container(
                  padding: EdgeInsets.all(responsive.wp(2.5)),
                  decoration: BoxDecoration(
                    color: transaction['isPositive']
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    transaction['icon'],
                    color:
                        transaction['isPositive'] ? Colors.green : Colors.red,
                    size: responsive.wp(5),
                  ),
                ),
                title: Text(
                  transaction['type'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: responsive.sp(14),
                  ),
                ),
                subtitle: Text(
                  transaction['date'],
                  style: TextStyle(
                    fontSize: responsive.sp(12),
                    color: Colors.grey,
                  ),
                ),
                trailing: Text(
                  '${transaction['isPositive'] ? '+' : '-'} Rp ${transaction['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        transaction['isPositive'] ? Colors.green : Colors.red,
                    fontSize: responsive.sp(14),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

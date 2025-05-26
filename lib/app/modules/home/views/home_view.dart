import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/utils/auto_responsive.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/home/navbar.dart'; // Add this import

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return Scaffold(
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

                // Financial Cards
                _buildFinancialCards(responsive),

                SizedBox(height: responsive.hp(3)),

                // Statistics Charts
                _buildStatisticsCharts(responsive),

                SizedBox(height: responsive.hp(3)),

                // Transaction History
                _buildTransactionHistory(responsive),

                SizedBox(height: responsive.hp(3)),

                // Portfolio List
                _buildPortfolioList(responsive),

                // Add some bottom padding for scrolling
                SizedBox(height: responsive.hp(10)),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(), // This now references the imported widget
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
                'https://ui-avatars.com/api/?name=Deny+Arifin&background=0D8ABC&color=fff',
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
                  'Deny Arifin',
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
        // Dana Tersalur Card
        Expanded(
          child: _buildFinancialCard(
            responsive,
            title: 'Dana Tersalur',
            amount: 'Rp 20.000.000',
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
            amount: 'Rp 30.000.000',
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
          'Statistik',
          style: TextStyle(
            fontSize: responsive.sp(18),
            fontWeight: FontWeight.bold,
            color: Color(0xFF011936),
          ),
        ),
        SizedBox(height: responsive.hp(2)),
        // Dana Tersalur Chart
        _buildChart(responsive, 'Statistik Penyaluran Dana', true),
        SizedBox(height: responsive.hp(2)),
        // Imbal Hasil Chart
        _buildChart(responsive, 'Statistik Imbal Hasil', false),
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
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const months = [
                                'Jan',
                                'Feb',
                                'Mar',
                                'Apr',
                                'Mei',
                                'Jun',
                                'Jul',
                                'Ags',
                                'Sep',
                                'Okt',
                                'Nov',
                                'Des',
                              ];
                              if (value.toInt() >= 0 &&
                                  value.toInt() < months.length) {
                                return Text(
                                  months[value.toInt()],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: responsive.sp(10),
                                  ),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 2),
                            FlSpot(2, 5),
                            FlSpot(3, 3.1),
                            FlSpot(4, 4),
                            FlSpot(5, 3),
                            FlSpot(6, 4),
                            FlSpot(7, 4.2),
                            FlSpot(8, 5.1),
                            FlSpot(9, 4.2),
                            FlSpot(10, 3),
                            FlSpot(11, 4.5),
                          ],
                          isCurved: true,
                          color: Color(0xFF011936),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Color(0xFF011936).withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        'type': 'Simpanan Pokok',
        'date': '12 Mei 2025',
        'amount': 1500000,
        'isPositive': false,
        'icon': Icons.arrow_upward,
      },
      {
        'type': 'Imbal Hasil',
        'date': '10 Mei 2025',
        'amount': 250000,
        'isPositive': true,
        'icon': Icons.arrow_downward,
      },
      {
        'type': 'Angsuran Pokok',
        'date': '5 Mei 2025',
        'amount': 750000,
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
              'Riwayat Transaksi',
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
                    color:
                        transaction['isPositive']
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

  Widget _buildPortfolioList(AutoResponsive responsive) {
    List<Map<String, dynamic>> portfolios = [
      {
        'name': 'Siti Nurul',
        'role': 'Modal Pengrajin',
        'amount': 5000000,
        'roi': 15,
        'tenor': '12 bulan',
        'progress': 0.7,
      },
      {
        'name': 'Ahmad Dahlan',
        'role': 'Pedagang Pasar',
        'amount': 3500000,
        'roi': 12,
        'tenor': '8 bulan',
        'progress': 0.4,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Portofolio Usaha',
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
        ...portfolios
            .map(
              (portfolio) => Container(
                margin: EdgeInsets.only(bottom: responsive.hp(2)),
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
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: responsive.wp(6),
                          backgroundColor: Color(0xFF011936),
                          child: Text(
                            portfolio['name'][0],
                            style: TextStyle(
                              fontSize: responsive.sp(16),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: responsive.wp(3)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                portfolio['name'],
                                style: TextStyle(
                                  fontSize: responsive.sp(16),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF011936),
                                ),
                              ),
                              Text(
                                portfolio['role'],
                                style: TextStyle(
                                  fontSize: responsive.sp(12),
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.hp(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildPortfolioDetail(
                          responsive,
                          'Nominal',
                          'Rp ${portfolio['amount'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        ),
                        _buildPortfolioDetail(
                          responsive,
                          'Imbal Hasil',
                          '${portfolio['roi']}%',
                        ),
                        _buildPortfolioDetail(
                          responsive,
                          'Tenor',
                          portfolio['tenor'],
                        ),
                      ],
                    ),
                    SizedBox(height: responsive.hp(2)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sisa Plafond',
                              style: TextStyle(
                                fontSize: responsive.sp(12),
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              '${(portfolio['progress'] * 100).toInt()}%',
                              style: TextStyle(
                                fontSize: responsive.sp(12),
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF011936),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: responsive.hp(0.5)),
                        LinearProgressIndicator(
                          value: portfolio['progress'],
                          backgroundColor: Colors.grey[200],
                          color: Color(0xFF011936),
                          minHeight: responsive.hp(1),
                          borderRadius: BorderRadius.circular(responsive.wp(1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildPortfolioDetail(
    AutoResponsive responsive,
    String label,
    String value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: responsive.sp(12),
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: responsive.hp(0.3)),
        Text(
          value,
          style: TextStyle(
            fontSize: responsive.sp(14),
            fontWeight: FontWeight.bold,
            color: Color(0xFF011936),
          ),
        ),
      ],
    );
  }
}

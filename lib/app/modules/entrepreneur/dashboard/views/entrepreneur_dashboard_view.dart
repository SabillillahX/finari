import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/auto_responsive.dart';
import '../../../../widgets/home/navbar.dart';
import '../controllers/entrepreneur_dashboard_controller.dart';

class EntrepreneurDashboardView extends GetView<EntrepreneurDashboardController> {
  const EntrepreneurDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final responsive = AutoResponsive(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Entrepreneur'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(responsive.wp(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  CircleAvatar(
                    radius: responsive.wp(6),
                    backgroundImage: NetworkImage(
                      'https://ui-avatars.com/api/?name=Entrepreneur&background=0D8ABC&color=fff',
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
                        'Entrepreneur',
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
              SizedBox(height: responsive.hp(2)),
              // Card Business Funding
              Container(
                width: double.infinity,
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
                      'Dana Terkumpul',
                      style: TextStyle(
                        fontSize: responsive.sp(14),
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: responsive.hp(0.5)),
                    Text(
                      'Rp 15.000.000',
                      style: TextStyle(
                        fontSize: responsive.sp(20),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF011936),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.hp(2)),
              // List of Funding Campaigns
              Text(
                'Kampanye Pendanaan',
                style: TextStyle(
                  fontSize: responsive.sp(16),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF011936),
                ),
              ),
              SizedBox(height: responsive.hp(1)),
              ...List.generate(2, (i) => Container(
                margin: EdgeInsets.only(bottom: responsive.hp(1)),
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
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF011936),
                      child: Text('K', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: responsive.wp(3)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kampanye Bisnis ${i+1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.sp(14),
                              )),
                          Text('Target: Rp 25.000.000',
                              style: TextStyle(
                                fontSize: responsive.sp(12),
                                color: Colors.grey[700],
                              )),
                        ],
                      ),
                    ),
                    Text('60%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF011936),
                        )),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

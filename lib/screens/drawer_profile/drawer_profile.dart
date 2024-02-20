import 'package:blood_bd/global/app_routes.dart';
import 'package:blood_bd/screens/drawer_profile/drawer_pages/medical_history.dart';
import 'package:blood_bd/screens/drawer_profile/components/custom_drawer_links.dart';
import 'package:blood_bd/screens/drawer_profile/components/drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    return Drawer(
      child: ListView(
        children: [
          // -------Drawer Header------------
          const DrawerHeaderPage(),

          // -------Drawer Body------------
          ActiveDonor(),

          CustomDrawerLinks(
            title: 'Medical History',
            icon: Icons.medical_information_outlined,
            onTap: () {
              Get.to( MedicalHistory());
            },
          ),
          CustomDrawerLinks(
            title: 'Notifications',
            icon: Icons.notifications_active,
            onTap: () {
              Get.toNamed(notificationPage);
            },
          ),
          CustomDrawerLinks(
            title: 'Donation Accepted',
            icon: Icons.bloodtype_outlined,
            onTap: () {
              Get.toNamed(donationAccepted);
            },
          ),
          CustomDrawerLinks(
            title: 'Donation Blocked',
            icon: Icons.bloodtype_outlined,
            onTap: () {
              Get.toNamed(donationBlocked);
            },
          ),
          CustomDrawerLinks(
            title: 'History',
            icon: Icons.history_edu_outlined,
            onTap: () {
              Get.toNamed(history);
            },
          ),
          CustomDrawerLinks(
            title: 'My Search History',
            icon: Icons.content_paste_search_outlined,
            onTap: () {
              Get.toNamed(mySearchHistory);
            },
          ),
          CustomDrawerLinks(
            title: 'Customer Support',
            icon: Icons.privacy_tip_outlined,
            onTap: () {},
          ),
          CustomDrawerLinks(
            title: 'Privacy Settings',
            icon: Icons.question_answer_outlined,
            onTap: () {},
          ),
          CustomDrawerLinks(
            title: 'FAQ',
            icon: Icons.support_agent_outlined,
            onTap: () {},
          ),
          CustomDrawerLinks(
            title: 'Logout',
            icon: Icons.logout_outlined,
            onTap: () {
              getStorage.erase();
              Get.offAllNamed(welcomePage);
            },
          ),
        ],
      ),
    );
  }
}

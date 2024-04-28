import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:blood_bd/screens/drawer_profile/drawer_pages/donation_status.dart';
import 'package:blood_bd/utils/app_routes.dart';
import 'package:blood_bd/screens/drawer_profile/drawer_pages/medical_history.dart';
import 'package:blood_bd/screens/drawer_profile/components/custom_drawer_links.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/profile_controller.dart';
import 'components/drawer_header.dart';
import 'drawer_pages/change_password.dart';
import 'drawer_pages/request_status.dart';

class DrawerProfile extends StatelessWidget {
  DrawerProfile({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    return Drawer(
      backgroundColor: AppTheme.primary,
      child: ListView(
        children: [
          // -------Drawer Header------------
          const DrawerHeaderPage(),

          // -------Drawer Body------------
          // ActiveDonor(value: ,),
          CustomDrawerLinks(
            title: 'Profile',
            icon: Icons.person,
            onTap: () {
              controller.profileData();
            },
          ),

          CustomDrawerLinks(
            title: 'Medical History',
            icon: Icons.medical_information_outlined,
            onTap: () {
              Get.to(MedicalHistory());
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
            title: 'Donation Requests',
            icon: Icons.bloodtype_outlined,
            onTap: () {
              Get.to(DonationStatus());
            },
          ),
          CustomDrawerLinks(
            title: 'Request status',
            icon: Icons.bloodtype_outlined,
            onTap: () {
              Get.to(RequestStatus());
            },
          ),
          CustomDrawerLinks(
            title: 'History',
            icon: Icons.history_edu_outlined,
            onTap: () {
              Get.toNamed(history);
            },
          ),
          // CustomDrawerLinks(
          //   title: 'My Search History',
          //   icon: Icons.content_paste_search_outlined,
          //   onTap: () {
          //     Get.toNamed(mySearchHistory);
          //   },
          // ),
          CustomDrawerLinks(
            title: 'Change Password',
            icon: Icons.password,
            onTap: () {
              Get.to(ChangePassword());
            },
          ),
          // CustomDrawerLinks(
          //   title: 'Customer Support',
          //   icon: Icons.privacy_tip_outlined,
          //   onTap: () {},
          // ),
          // CustomDrawerLinks(
          //   title: 'Privacy Settings',
          //   icon: Icons.question_answer_outlined,
          //   onTap: () {},
          // ),
          // CustomDrawerLinks(
          //   title: 'FAQ',
          //   icon: Icons.support_agent_outlined,
          //   onTap: () {},
          // ),
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

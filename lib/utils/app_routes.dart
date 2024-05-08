import 'package:blood_bd/screens/profile/update_profile.dart';
import 'package:blood_bd/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/blood_request_donor/add_request.dart';
import '../screens/blood_request_donor/become_donor_page.dart';
import '../screens/blood_request_donor/blood_heroes_page.dart';
import '../screens/blood_request_donor/blood_request_page.dart';
import '../screens/drawer_profile/drawer_pages/medical_history/medical_history_report.dart';
import '../screens/drawer_profile/drawer_pages/donation_accepted.dart';
import '../screens/drawer_profile/drawer_pages/donation_blocked.dart';
import '../screens/drawer_profile/drawer_pages/medical_history.dart';
import '../screens/drawer_profile/drawer_pages/mySearch_history.dart';
import '../screens/drawer_profile/drawer_pages/notification_page.dart';
import '../screens/history/user_history.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/user_auth/welcome_screen.dart';

const splashScreen = "/";
const welcomePage = "/welcomePage";
const home = "/home";
const forgetPasswordPage = "/forgetPasswordPage";
const editProfile = "/editProfile";
const notificationPage = "/notificationPage";
const searchDonor = "/searchDonor";
const bloodHeroes = "/bloodHeroes";
const requestBlood = "/requestBlood";
const feedPage = "/feedPage";
const medicalHistory = "/medicalHistory";
const newReport = "/newReport";
const donationAccepted = "/donationAccepted";
const donationBlocked = "/donationBlocked";
const history = "/history";
const mySearchHistory = "/mySearchHistory";

final pages = [
  customPage(name: splashScreen, page: const SplashScreen()),
  customPage(name: welcomePage, page: WelcomePage()),

  //-------------App Screens---------------------------

  customPage(name: home, page: const HomeScreen()),
  customPage(name: searchDonor, page: const BecomeDonor()),
  customPage(name: bloodHeroes, page:  BloodHeroes()),
  customPage(name: requestBlood, page: const RequestBlood()),
  customPage(name: feedPage, page: FeedPage()),

  //-------------Drawer Pages---------------------------

  // customPage(name: editProfile, page: EditProfile()),
  customPage(name: notificationPage, page: const NotificationPage()),
  customPage(name: medicalHistory, page:  MedicalHistory()),
  customPage(name: newReport, page: NewReport()),
  customPage(name: donationAccepted, page: DonationAccepted()),
  customPage(name: donationBlocked, page: const DonationBlocked()),
  customPage(name: history, page: const BloodHistory()),
  customPage(name: mySearchHistory, page: const MySearchHistory()),
];

GetPage customPage({required String name, required Widget page}) {
  return GetPage(
    name: name,
    page: () => page,
    transition: Transition.cupertino,
  );
}

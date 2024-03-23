import 'package:blood_bd/controllers/home_controller.dart';
import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/home_screen/widgets/banner_widget.dart';
import 'package:blood_bd/screens/home_screen/widgets/find_button.dart';
import 'package:blood_bd/screens/home_screen/widgets/icon_banner.dart';
import 'package:blood_bd/screens/home_screen/widgets/textfield_widget.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/profile_controller.dart';
import '../../global/app_routes.dart';
import '../../utils/assets_links.dart';
import '../drawer_profile/drawer_profile.dart';
import '../home_card_pages/blood_request_pagee.dart';
import '../nav_pages/health.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final getStorage = GetStorage();
  final HomeController homeController = Get.put(HomeController());
  // final HomeController homeController = Get.put(HomeController());
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    // var pages = [
    //   HomePage(),
    //   FeedPage(),
    //   const HealthPage(),
    // ];

    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.redAccent,
                  ),
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  actions: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed(notificationPage);
                        },
                        icon: const Badge(
                          backgroundColor: Colors.white10,
                          label: Text(
                            "1",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            // color: Colors.white,
                            size: 24,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () {
                          controller.profileData();
                          // Get.to(ProfilePage());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 30,
                          height: 30,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(ImageLink.profile),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                  // leading: GestureDetector(
                  //   child: const Icon(Icons.menu),
                  //   onTap: () {
                  //     controller.profileData();
                  //   },
                  // ),
                ),
                SizedBox(
                  height: Get.height * .4,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * .2,
                        width: Get.width,
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          ),
                        ),
                        child: const Text(
                          "Blood BD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: Get.height * .3,
                          width: Get.width * .7,
                          decoration: BoxDecoration(
                            // ------------find donor card color--------------
                            color: Colors.white,
                            // ------------find donor card--------------
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Form(
                            key: homeController.formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFieldWidget(
                                  label: 'Select District',
                                  dropDownList: DataList.districtListData,
                                  onChanged: (value) {
                                    homeController.district = value.toString();
                                  },
                                ),
                                TextFieldWidget(
                                  label: 'Select Blood Group',
                                  dropDownList: DataList.bloodListData,
                                  onChanged: (value) {
                                    homeController.bloodType = value.toString();
                                  },
                                ),
                                FindDonorBtn(
                                  onPressed: () {
                                    homeController.findDonor();
                                  },
                                  child: "Find Donor",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Get.height * .05),
                // CardSections(),
                const HomeScreenIcons(),
                SizedBox(height: Get.height * .06),
                Container(
                  // padding: EdgeInsets.all(5),
                  height: Get.height * .2,
                  width: Get.width * .85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: Get.width * .25,
                        height: Get.height,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Colors.white60,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "assets/images/blood_drop.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "A+",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: Get.width * .3,
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, right: 10),
                          height: Get.height,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.greenAccent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.add_box_sharp),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.calendar_month_sharp),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Name",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    // child: ElevatedButton(
                                    //     onPressed: () {},
                                    //     child: const Text("Urgent")),
                                    child: FindDonorBtn(
                                      onPressed: () {},
                                      child: 'Urgent',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * .06),
                const BannerWidget(),
              ],
            ),
          ),
        ),
      ),
      drawer: const DrawerProfile(),
    );


    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   bottomNavigationBar: CurvedNavigationBar(
    //     backgroundColor: AppTheme.primary,
    //     color: AppTheme.primaryRed,
    //     animationDuration: const Duration(milliseconds: 300),
    //     animationCurve: Curves.fastLinearToSlowEaseIn,
    //     items: const [
    //       CurvedNavigationBarItem(
    //           child: Icon(
    //             Icons.home_outlined,
    //             color: Colors.white,
    //           ),
    //           label: 'Home',
    //           labelStyle: TextStyle(color: Colors.white)),
    //       CurvedNavigationBarItem(
    //           child: Icon(
    //             Icons.bloodtype_outlined,
    //             color: Colors.white,
    //           ),
    //           label: 'Blood Request',
    //           labelStyle: TextStyle(color: Colors.white)),
    //       CurvedNavigationBarItem(
    //           child: Icon(
    //             Icons.health_and_safety,
    //             color: Colors.white,
    //           ),
    //           label: 'Health',
    //           labelStyle: TextStyle(color: Colors.white)),
    //     ],
    //     index: homeController.selectedItem.value,
    //     onTap: (index) {
    //       homeController.navbarFunction(index);
    //     },
    //     // letIndexChange: (index) => true,
    //   ),
    //   body: Obx(
    //     () => pages[homeController.selectedItem.value],
    //   ),
    // );
  }
}

// class HomePage extends StatelessWidget {
//   HomePage({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }

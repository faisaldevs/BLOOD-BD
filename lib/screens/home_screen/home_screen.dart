import 'package:blood_bd/controllers/home_controller.dart';
import 'package:blood_bd/data_list/data_list.dart';
import 'package:blood_bd/screens/home_screen/widgets/banner_widget.dart';
import 'package:blood_bd/screens/home_screen/widgets/card.dart';
import 'package:blood_bd/screens/home_screen/widgets/find_button.dart';
import 'package:blood_bd/screens/home_screen/widgets/icon_banner.dart';
import 'package:blood_bd/screens/home_screen/widgets/textfield_widget.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/blood_request_controller.dart';
import '../../utils/app_routes.dart';
import '../../models/blood_request_model.dart';
import '../../utils/assets_links.dart';

import '../blood_request_donor/blood_request_page.dart';
import '../drawer_profile/drawer_profile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //
  // final getStorage = GetStorage();
  final HomeController homeController = Get.put(HomeController());

  // final ProfileController controller = Get.put(ProfileController());
  final BloodRequestController bloodController =
      Get.put(BloodRequestController());

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
                          // controller.profileData();
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
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
                  height: Get.height * .24,
                  width: Get.width * .9,
                  // padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Urgent Blood Request",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(FeedPage());
                                },
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: FutureBuilder<List<RequestBloodModel>>(
                            future: bloodController.getRequestData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Center(
                                    child: Text('Something went wrong'));
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasData) {
                                // List dataList = snapshot.data as List;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    RequestBloodModel e = snapshot.data![index];
                                    String contactPersonName =
                                        e.contactPersonName ?? "name";
                                    String number =
                                        e.contactPersonPhone ?? "01*********";
                                    String patientsName =
                                        e.patientsName ?? "Patient Name";
                                    String healthIssue =
                                        e.healthIssue ?? "Health Issue";
                                    String hospitalName =
                                        e.hospitalName ?? "Hospital Name";
                                    String bloodAmount =
                                        e.amountBag ?? "Blood Amount";
                                    String bloodType = e.bloodGroup ?? "Type";
                                    String date = e.date ?? "date";
                                    String time = e.time ?? "time";
                                    String address = e.address ?? "address";
                                    String note = e.note ?? "note";

                                    return UrgentRequest(
                                      patientsName: patientsName,
                                      hospitalName: hospitalName,
                                      address: address,
                                      date: date,
                                      bloodType: bloodType,
                                    );
                                  },
                                );
                              }
                              // else {
                              //   return const Center(child: CircularProgressIndicator());
                              // }
                              return const Text("data");
                            },
                          ),

                          //ListView.builder(
                          //                             scrollDirection: Axis.horizontal,
                          //                             // padding: EdgeInsets.symmetric(horizontal: 10),
                          //                             itemCount: 10,
                          //                             itemBuilder: (context, index) {
                          //                               return const UrgentRequest();
                          //                             },
                          //                           ),
                        ),
                      )
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
      drawer: DrawerProfile(),
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

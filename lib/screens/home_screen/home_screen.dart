import 'package:blood_bd/controllers/home_controller.dart';
import 'package:blood_bd/screens/home_screen/widgets/banner_widget.dart';
import 'package:blood_bd/screens/home_screen/widgets/card.dart';
import 'package:blood_bd/screens/home_screen/widgets/find_donor_ui.dart';
import 'package:blood_bd/screens/home_screen/widgets/icon_banner.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app_notifications/notification_services.dart';
import '../../controllers/blood_request_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../utils/app_routes.dart';
import '../../models/blood_request_model.dart';
import '../../utils/assets_links.dart';
import '../blood_request_donor/blood_request_page.dart';
import '../drawer_profile/drawer_profile.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  // final LocationController locationController = Get.put(LocationController());

  final ProfileController controller = Get.put(ProfileController());

  final BloodRequestController bloodController =
      Get.put(BloodRequestController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // locationController.fetchDivisions();
  //
  //   super.initState();
  // }

  final NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState

    homeController.profileData();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) async{
      print("Device Token: $value");

      var api = "https://starsoftjpn.xyz/api/auth/store-token";

     try{
       print("object");
       var res = await http.post(Uri.parse(api),
           headers: {
             "Accept" : "application/json",
             "Authorization" : GetStorage().read("token").toString(),
           },
           body: {
             "token" : value.toString(),
           }
       );
       print(res.statusCode);
       print(res.body);
       if(res == 201){
         print("Device token was sent..!!");
         print(res.statusCode);
         print(res.body);
       }
     }catch(e){
       print("Error : $e");
     }



    });
    super.initState();
  }

  String? selectedDivision;
  String? selectedDistrict;
  String? selectedThana;

  @override
  Widget build(BuildContext context) {
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
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          // color: Colors.white,
                          size: 24,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        onTap: () {
                          controller.profileData();
                          // AwesomeNotify().triggerNotification("title", "body");
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
                          padding: const EdgeInsets.all(8),
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
                          child: const FindDonorUi(),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: Get.height * .05),
                // CardSections(),
                HomeScreenIcons(),
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
                                    color: Colors.red,
                                  ),
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
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: FutureBuilder<RequestBloodModel>(
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
                                final dataList = snapshot.data!;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.data!.length < 8 ? snapshot.data?.data?.length : 5,
                                  itemBuilder: (context, index) {
                                    final e = dataList.data?[index];
                                    var requestId = e?.id;
                                    String requestUserId = e?.user?.id.toString() ?? "name";
                                    String contactPersonName =
                                        e?.contactPersonName ?? "name";
                                    String contactPersonNumber =
                                        e?.contactPersonPhone ?? "01*********";
                                    String patientsName =
                                        e?.patientsName ?? "Patient Name";
                                    String healthIssue =
                                        e?.healthIssue ?? "Health Issue";
                                    String hospitalName =
                                        e?.hospitalName ?? "Hospital Name";
                                    String bloodAmount =
                                        e?.amountBag.toString() ?? "Blood Amount";
                                    String bloodType = e?.bloodGroup ?? "Type";
                                    String date = e?.date ?? "date";
                                    String time = e?.time ?? "time";
                                    String address = e?.address ?? "address";
                                    String note = e?.note ?? "note";
                                    String deviceToken = e?.user?.deviceToken ?? "note";

                                    return UrgentRequest(

                                      patientsName: patientsName,
                                      hospitalName: hospitalName,
                                      address: address,
                                      date: date,
                                      bloodType: bloodType,
                                      contractPersonName: contactPersonName,
                                      contractPersonNumber: contactPersonNumber,
                                      healthIssue: healthIssue,
                                      bloodAmount: bloodAmount.toString(),
                                      time: time,
                                      note: note,
                                      requestId: requestId.toString(), requestUserId: requestUserId,deviceToken: deviceToken,
                                    );
                                  },
                                );
                              } else {
                                return const Text("No data found..");
                              }
                            },
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
      drawer: DrawerProfile(),
    );
  }
}

import 'package:blood_bd/app_notifications/local%20notification_pc.dart';
import 'package:blood_bd/controllers/profile_controller.dart';
import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/become_donor_controller.dart';
import '../../../utils/app_routes.dart';
import '../../blood_request_donor/blood_request_page.dart';


class HomeScreenIcons extends StatelessWidget {
   HomeScreenIcons({super.key});
 final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // height: 250,
      width: Get.width * .9,
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
        children: [
          Container(
            // height: 40,
            width: Get.width,
            padding: const EdgeInsets.only(left: 20, top: 16),
            child: Text(
              "More Items",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColorRed),
            ),
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(requestBlood);
                          // LocalNotificationService().initLocalNotification();
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.note_add_outlined,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Add Request",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.textColorRed),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {

                          controller.donorValidate();
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.person_add_alt_1_outlined,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Become Donor",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColorRed,
                                ),
                                // maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            )),
                      ),
                    ),

                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(bloodHeroes);
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.add_box,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Blood Bank",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColorRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {
                          Get.to(FeedPage());
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.bloodtype_outlined,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Blood Request",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColorRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(history);
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.history_outlined,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColorRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: IconButton(
                        onPressed: () {},
                        icon: Column(
                          children: [
                            Icon(
                              Icons.feedback_outlined,
                              size: 34,
                              color: AppTheme.textColorRed,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "FeedBack",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textColorRed,
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

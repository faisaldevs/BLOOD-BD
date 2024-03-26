import 'package:blood_bd/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BloodHeroList extends StatelessWidget {
  const BloodHeroList({super.key});

  @override
  Widget build(BuildContext context) {
    String? name = "Faisal";
    String? address = "Kazipara, Mirpur, Dhaka";
    String? number1 = "01903440069";
    String? number2 = "0122355";
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: AppTheme.textFieldColor,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        padding: const EdgeInsets.only(left: 16, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              address,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 0),
              child: Text(
                "contract :",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          launchUrlString("tel:$number1");
                        },
                        icon: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              number1,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString("tel:$number2");
                        },
                        style: const ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0))),
                        icon: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              number2,
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ReceiverRequestFeed extends StatefulWidget {
  const ReceiverRequestFeed({super.key});

  @override
  State<ReceiverRequestFeed> createState() => _ReceiverRequestFeed();
}

class _ReceiverRequestFeed extends State<ReceiverRequestFeed> {
  final sdStorage = GetStorage();

  sdStorageClear() {
    // var patientName = sdStorage.remove("patientName");
    // var bloodType = sdStorage.remove("bloodType");
    // var bloodAmount = sdStorage.remove("bloodAmount");
    // var healthIssue = sdStorage.remove("healthIssue");
    // var date = sdStorage.remove("date");
    // var time = sdStorage.remove("time");
    // var contactParsonPhone = sdStorage.remove("contactParsonPhone");
    // var contactParsonName = sdStorage.remove("contactParsonName");
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    //---------------------------------------
    // var patientName = sdStorage.read("patientName");
    // var bloodType = sdStorage.read("bloodType");
    // var bloodAmount = sdStorage.read("bloodAmount");
    // var healthIssue = sdStorage.read("healthIssue");
    // var date = sdStorage.read("date");
    // var time = sdStorage.read("time");
    // var contactParsonPhone = sdStorage.read("contactParsonPhone");
    // var contactParsonName = sdStorage.read("contactParsonName");

    String showTime() {
      DateTime now;

      now = DateTime.now();

      String formattedDate = DateFormat('dd MMM, kk:mm a').format(now);

      return formattedDate;
    }

    //---------------------------------------------------------------

    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        width: Get.width,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: Get.width * .1,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ),
                Container(
                  width: Get.width * .775,
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Jami Ahmed",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            showTime(),
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      const Text("Address : ",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Patient's Name : ",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text("Health Issue : ",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      Text("Blood Required : ",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Text(
                          "A+",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                          ),
                          child: isVisible
                              ? const Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chevron_up,
                                      size: 16,
                                    ),
                                    Text("Show less")
                                  ],
                                )
                              : const Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.chevron_down,
                                      size: 16,
                                    ),
                                    Text("Show more")
                                  ],
                                ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Address :"),
                      Text("Date & Time :"),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Contact Person's Name"),
                      Text("Contact Person's Number"),
                    ],
                  ),
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Massage"),
                      Text(
                          "dew   wwe 0eew dogie  eu ihhjfiew site heo h wo "),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    sdStorageClear();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.red),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Call",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color(0xff026b49)),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "I'm Interested",
                    style: TextStyle(color: Colors.white),
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

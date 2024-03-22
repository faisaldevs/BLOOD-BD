import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_history_controller.dart';
import '../../models/blood_donate_history_model.dart';

class HistoryDonate extends StatelessWidget {
   HistoryDonate({super.key});
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<List<BloodDonateHistory>>(
        future: controller.getHistoryDonate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List dataList = snapshot.data as List;
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                BloodDonateHistory e = snapshot.data![index];
                return ListTile(
                  title: Text(e.contactPersonName.toString()),
                  subtitle: Text(snapshot.data!.length.toString()),
                );
              },);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

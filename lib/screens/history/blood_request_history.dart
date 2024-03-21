import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_history_controller.dart';
import '../../models/blood_request_history_model.dart';

class HistoryRequest extends StatelessWidget {
   HistoryRequest({super.key});
 final HistoryController controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<List<BloodRequestHistoryModel>>(
        future: controller.getHistoryRequest(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // List dataList = snapshot.data as List;
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                BloodRequestHistoryModel e = snapshot.data![index];
                return ListTile(
                  title: Text(e.patientsName.toString()),
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

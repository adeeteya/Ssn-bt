import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssnbt/controllers/lost_item_controller.dart';
import 'package:ssnbt/screens/report_lost_item.dart';
import 'package:ssnbt/widgets/lost_item_card.dart';

class LostFound extends StatelessWidget {
  LostFound({Key? key}) : super(key: key);
  final _lostItemController = Get.put(LostItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Report Lost Item',
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => ReportLostItem(), transition: Transition.zoom);
        },
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  iconSize: 24,
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                const Text(
                  "Requests Raised",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Obx(
                () {
                  if (_lostItemController.lostItemsList.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Requests Raised',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  } else {
                    return ListView(
                      children: _lostItemController.lostItemsList.value
                          .map(
                            (element) => LostItemCard(lostItem: element),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

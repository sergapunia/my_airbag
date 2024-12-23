import 'package:airbag_project_new/dialogs/dialo_add_rifle.dart';
import 'package:airbag_project_new/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';

import '../models/refill_model.dart';
import '../services/account_valancer.dart';
import '../services/shared/refills_shared_service.dart';
import '../widgets/refill_card.dart';

class RefillsScreen extends StatefulWidget {
  const RefillsScreen({super.key});

  @override
  State<RefillsScreen> createState() => _RefillsScreenState();
}

class _RefillsScreenState extends State<RefillsScreen> {
  List<RefillModel> refills = [];
  @override
  void initState() {
    super.initState();
    updateRefills();
  }

  Future<void> updateRefills() async {
    refills = await RefillsSharedService.getAllRefills();
    AccountBalancer.calculateTotalBalances(refills);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            rowButtons(),
            columnRefill(),
            Expanded(
              child: allAddeds(),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MyCustomButton(
          title: "Add riflle",
          onTap: () {
            showDialogAddRiflle(context, () async {
              await updateRefills();
            });
          },
          backgroundColor: Colors.black,
          border: true,
          borderColor: Colors.white,
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget allAddeds() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
          itemCount: refills.length,
          itemBuilder: (context, index) {
            return RefillCard(
              refill: refills[index],
              indexRefill: index,
              callbackEditing: () async {
                await updateRefills();
              },
            );
          }),
    );
  }

  Widget columnRefill() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Пополнено",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Expanded(
                child: cardWithSumm(AccountBalancer.totalRubbleRefill, "₽")),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: cardWithSumm(AccountBalancer.totalDollarRefill, "\$")),
          ],
        )
      ],
    );
  }

  Widget cardWithSumm(double count, String sufix) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          "${count.toStringAsFixed(2)} $sufix",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

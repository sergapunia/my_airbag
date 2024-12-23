import 'dart:developer';

import 'package:airbag_project_new/models/refill_model.dart';
import 'package:airbag_project_new/services/datetime_service.dart';
import 'package:airbag_project_new/services/shared/refills_shared_service.dart';
import 'package:airbag_project_new/widgets/bottom_menu_card.dart';
import 'package:airbag_project_new/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class RefillCard extends StatelessWidget {
  RefillCard({
    super.key,
    required this.refill,
    required this.indexRefill,
    required this.callbackEditing,

  });
  RefillModel refill;
  int indexRefill;
  Function callbackEditing;

  Future<void> deleteRefill()async{
    await RefillsSharedService.deleteRefill(indexRefill);
    callbackEditing();
  }

  Future<void> editRefill()async{}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowFromInfo(refill.nameFiat, refill.countFiat),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_circle_down,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                rowFromInfo(refill.tokenName, refill.countToken),
              ],
            ),
          ),
          Expanded(child: columnPrices()),
        ],
      ),
    );
  }

  Widget columnPrices() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BottomMenuCard(
            icon: Icons.more_horiz,
            colorIcon: const Color.fromARGB(255, 98, 0, 115),
            sizeIcon: 35,
            items: [
              "Редактировать",
              "Удалить"
            ],
            selectors: [
              (value) async{
                await editRefill();
              },
              (value) async{
                await deleteRefill();
              },
            ]),
        RichText(
          text: TextSpan(
            text: "For: ${refill.byPriceToken} ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: "${refill.nameFiat}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Text("Spread: ${refill.spread.toStringAsFixed(2)}%",
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
        RichText(
          text: TextSpan(
            text: "Price: ${refill.realPriceToken} ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: "${refill.nameFiat}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        CustomDivider(
          height: 2,
          width: 100,
          color: Colors.white,
          padVert: 4,
        ),
        Text(
          DatetimeService.getFormattedDate(refill.date),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget rowFromInfo(String nameSymbol, double count) {
    log(nameSymbol);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
          ),
          child: Text(
            nameSymbol,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Flexible(
          child: Text(
            "${count.toStringAsFixed([
              "USD",
              "RUB"
            ].contains(nameSymbol) ? 2 : 8)}",
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

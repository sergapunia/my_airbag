import 'package:airbag_project_new/api/coingecko_api.dart';
import 'package:airbag_project_new/dialogs/my_snack.dart';
import 'package:airbag_project_new/models/refill_model.dart';
import 'package:airbag_project_new/services/shared/refills_shared_service.dart';
import 'package:airbag_project_new/services/tokens_service.dart';
import 'package:airbag_project_new/widgets/bottom_with_menu.dart';
import 'package:airbag_project_new/widgets/my_custom_button.dart';
import 'package:airbag_project_new/widgets/my_input.dart';
import 'package:flutter/material.dart';

showDialogAddRiflle(BuildContext context, Function callback) {
  showModalBottomSheet(
      useRootNavigator: false,
      context: context,
      builder: (context) => _AddRiflleDialog(
            callback: callback,
          ));
}

class _AddRiflleDialog extends StatefulWidget {
  _AddRiflleDialog({
    super.key,
    required this.callback,
  });
  Function callback;
  @override
  State<_AddRiflleDialog> createState() => __AddRiflleDialogState();
}

class __AddRiflleDialogState extends State<_AddRiflleDialog> {
  TextEditingController countFiatController = TextEditingController();
  TextEditingController byPriceController = TextEditingController();
  String fiatSymbol = "RUB";
  String tokenSymbol = "";
  List<String> symbols = CoingeckoApi.cryptoIds.keys.map((e) => e).toList();
  Future<void> addRiflle() async {
    if (tokenSymbol.isNotEmpty &&
        fiatSymbol.isNotEmpty &&
        countFiatController.text.isNotEmpty &&
        byPriceController.text.isNotEmpty) {
      RefillModel refil = await TokensService.createRefill(
        fiatSymbol: fiatSymbol,
        tokenSymbol: tokenSymbol,
        countFiat: double.parse(countFiatController.text),
        byPrice: double.parse(byPriceController.text),
      );
      await RefillsSharedService.writeRefill(refil);
      Navigator.pop(context);
      widget.callback();
      showSnackbar(context, "Riflle added", false);
    } else {
      showSnackbar(context, "Error additing", true);
    }
  }

  void initDialog() {
    tokenSymbol = symbols[0];
  }

  @override
  void initState() {
    super.initState();
    initDialog();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 22, 22, 22),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Riflle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              fields(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: MyCustomButton(
                  title: "Save",
                  icon: Icons.save,
                  onTap: () async {
                    await addRiflle();
                  },
                  backgroundColor: Colors.black,
                  border: true,
                  borderColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonWithMenu(
          items: [],
          title: fiatSymbol,
          onTap: (value) {},
        ),
        MyInputField(
          controller: countFiatController,
          lable: "amount fiat",
        ),
        SizedBox(
          height: 20,
        ),
        ButtonWithMenu(
          items: symbols,
          title: tokenSymbol,
          onTap: (value) {
            setState(() {
              tokenSymbol = value;
            });
          },
        ),
        MyInputField(
          controller: byPriceController,
          lable: "by price",
        ),
      ],
    );
  }
}

import 'package:airbag_project_new/models/refill_model.dart';
import 'package:airbag_project_new/services/calculate_service.dart';

class AccountBalancer {

  static double totalRubbleRefill = 0;
  static double totalDollarRefill =0;

  static Future<void> calculateTotalBalances(List<RefillModel> refils)async{
    for(RefillModel i in refils){
      if(i.nameFiat=="RUB"){
        totalRubbleRefill+=i.countFiat;
      }
      else{
        //AnyFiat
      }
      if(i.tokenName=="USD"){
        totalDollarRefill+=i.countToken;
      }
      else{
        totalDollarRefill+=CalculateService.calculateSummSellDollars(i.countFiat, i.fiatPrice, i.byPriceToken);
      }
    }
  }

}
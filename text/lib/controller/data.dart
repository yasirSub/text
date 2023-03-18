import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  Controller() {
    retriveData();
  }

  void initStorage() async {
    await GetStorage.init("Datas");
  }

  var amount = 0.0.obs;
  var profit = 0.0.obs;
  var loss = 0.0.obs;
  var day = 0.obs;
  var totalProfit = 0.0.obs;
  var totalloss = 0.0.obs;
  var afterProfit = 0.0.obs;
  var afterLoss = 0.0.obs;
  var doneLoss = false;
  var nextProfit = 0.0.obs;
  var nextLoss = 0.0.obs;
  //-----------------------
  var widrawal = 0.0.obs;
  var widrawalInInr = 0.0.obs;
  //------------------------
  var bonous = 0.0.obs;
  //-------------------------
  var sepratorProfit = 0.0.obs;
  var partsProfit = 0.obs;
  var seperatedProfit = 0.0.obs;
  //---------------------------
  var sepratorLoss = 0.0.obs;
  var partsLoss = 0.obs;
  var seperatedLoss = 0.0.obs;
  //---------------------------
  var moneyManagementAmount = 0.0.obs;
  var moneyManagementTotalProfit = 0.0.obs;
  var moneyManagementTotalLoss = 0.0.obs;
  var moneyManagementTotalAfterProfit = 0.0.obs;
  var moneyManagementTotalAfterLoss = 0.0.obs;
  //--------------------------------------------
  var logggedin = false.obs;
  //--------------------------------------------
  void storeData() async {
    await GetStorage("Datas").write("amount", amount.value);
    await GetStorage("Datas").write("profit", profit.value);
    await GetStorage("Datas").write("loss", loss.value);
    await GetStorage("Datas").write("day", day.value);
    await GetStorage("Datas").write("totalProfit", totalProfit.value);
    await GetStorage("Datas").write("totalLoss", totalloss.value);
    await GetStorage("Datas").write("afterProfit", afterProfit.value);
    await GetStorage("Datas").write("afterLoss", afterLoss.value);
    await GetStorage("Datas").write("nextProfit", nextProfit.value);
    await GetStorage("Datas").write("nextLoss", nextLoss.value);
    await GetStorage("Datas").write("doneLoss", doneLoss);
  }

  void retriveData() async {
    amount.value = await GetStorage("Datas").read("amount") ?? 0;
    profit.value = await GetStorage("Datas").read("profit") ?? 0;
    loss.value = await GetStorage("Datas").read("loss") ?? 0;
    day.value = await GetStorage("Datas").read("day") ?? 0;
    totalProfit.value = await GetStorage("Datas").read("totalProfit") ?? 0;
    totalloss.value = await GetStorage("Datas").read("totalLoss") ?? 0;
    afterProfit.value = await GetStorage("Datas").read("afterProfit") ?? 0;
    afterLoss.value = await GetStorage("Datas").read("afterLoss") ?? 0;
    nextProfit.value = await GetStorage("Datas").read("nextProfit") ?? 0;
    nextLoss.value = await GetStorage("Datas").read("nextLoss") ?? 0;
    doneLoss = await GetStorage("Datas").read("doneLoss") ?? false;
  }

  void resetValue() {
    amount.value = 0;
    profit.value = 0;
    loss.value = 0;
    day.value = 0;
    totalProfit.value = 0;
    totalloss.value = 0;
    afterProfit.value = 0;
    afterLoss.value = 0;
    nextProfit.value = 0;
    nextLoss.value = 0;
    doneLoss = false;
  }

  //---------------------------------------------
  void moneyManagement() {
    moneyManagementAmount.value =
        moneyManagementTotalProfit.value + moneyManagementAmount.value;
    moneyManagementTotalProfit.value =
        moneyManagementAmount.value * (profit.value / 100);
    moneyManagementTotalLoss.value =
        moneyManagementAmount.value * (loss.value / 100);
    moneyManagementTotalAfterProfit.value =
        moneyManagementAmount.value + moneyManagementTotalProfit.value;
    moneyManagementTotalAfterLoss.value =
        moneyManagementAmount.value - moneyManagementTotalLoss.value;
  }

  //---------------------------------------------
  void total() {
    totalProfit.value = amount.value * (profit.value / 100);
    totalloss.value = amount.value * (loss.value / 100);
    afterProfit.value = amount.value + totalProfit.value;
    afterLoss.value = amount.value - totalloss.value;
    nextProfit.value = afterProfit * (profit.value / 100);
    nextLoss.value = afterLoss * (loss.value / 100);
    storeData();
  }

  void profitTap() {
    doneLoss = false;
    amount.value = totalProfit.value + amount.value;
    totalProfit.value = amount.value * (profit.value / 100);
    totalloss.value = amount.value * (loss.value / 100);
    afterProfit.value = amount.value + totalProfit.value;
    afterLoss.value = amount.value - totalloss.value;
    nextLoss.value = afterLoss * (loss.value / 100);
    nextProfit.value = afterProfit * (profit.value / 100);
    day.value++;
    storeData();
  }

  void lossTap() {
    doneLoss = true;
    if (totalloss < 0.009) {
      totalloss.value = 0;
      amount.value = 0;
    }
    amount.value = amount.value - totalloss.value;
    totalProfit.value = amount.value * (profit.value / 100);
    totalloss.value = amount.value * (loss.value / 100);
    afterProfit.value = amount.value + totalProfit.value;
    afterLoss.value = amount.value - totalloss.value;
    nextLoss.value = afterLoss * (loss.value / 100);
    nextProfit.value = afterProfit * (profit.value / 100);
    day.value++;
    storeData();
  }

  void inputProfit(double input) {
    widrawal.value = input - totalProfit.value;
    widrawalInInr.value = widrawal.value * 82;
  }

  void bonusCal(double amount) {
    bonous.value = bonous.value + (widrawal.value - amount);
    widrawal.value = widrawal.value - amount;
    storeData();
  }

  void seprateTheProfit(int divide) {
    seperatedProfit.value =
        (sepratorProfit.value.toPrecision(2) / divide).toPrecision(2);
  }

  void minusSepratedProfit(double value) {
    sepratorProfit.value =
        (sepratorProfit.value.toPrecision(2) - value.toPrecision(2))
            .toPrecision(2);
    if (sepratorProfit.value < 1) {
      sepratorProfit.value = 0;
    }
  }

  void addSepratedProfit(double value) {
    sepratorProfit.value =
        (sepratorProfit.value.toPrecision(2) + value.toPrecision(2))
            .toPrecision(2);
  }

//-------------------------------
  void seprateTheLoss(int divide) {
    seperatedLoss.value =
        (sepratorLoss.value.toPrecision(2) / divide).toPrecision(2);
  }

  void minusSepratedLoss(double value) {
    sepratorLoss.value =
        (sepratorLoss.value.toPrecision(2) - value.toPrecision(2))
            .toPrecision(2);
    if (sepratorLoss.value < 1) {
      sepratorLoss.value = 0;
    }
  }

  void addSepratedLoss(double value) {
    sepratorLoss.value =
        (sepratorLoss.value.toPrecision(2) + value.toPrecision(2))
            .toPrecision(2);
  }

  //-------------------------------
  void initValue() {}
}

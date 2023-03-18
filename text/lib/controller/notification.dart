import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:text/day.dart';

void notification(
    int day, double totalProfit, double totalloss, double amount) {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          channelKey: 'basic_channel',
          category: NotificationCategory.Event,
          notificationLayout: NotificationLayout.BigText,
          summary: "Day ${day.toString()}",
          groupKey: "Trade Shield",
          backgroundColor: Colors.white,
          color: Colors.black,
          ticker: newMethod,
          wakeUpScreen: true,
          id: 10,
          title: "${Emojis.money_coin} Trade Shield",
          body:
              'Amount: ${amount.toStringAsFixed(2)} Profit: ${(totalProfit).toStringAsFixed(2)} Loss: ${(totalloss).toStringAsFixed(2)}'));
}

String get newMethod => 'Trade Shield';

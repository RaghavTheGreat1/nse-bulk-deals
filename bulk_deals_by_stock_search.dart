import 'dart:io';
import 'main.dart';

void bulkDealsByStock() {
  print("Enter the Stock Symbol you want to search for: ");
  String? stockSearch = stdin.readLineSync()?.toUpperCase();
  List scripTradedDetails = [];
  for (int j = 0; j < fileContent.length; j++) {
    if (fileContent[j].split(",")[1].contains(stockSearch.toString())) {
      scripTradedDetails.add(fileContent[j].split(","));
      print(fileContent[j]);
    }
  }

// Calculates net BUY/SELL in the searched scrip.
  int netTradedShares = 0;
  scripTradedDetails.forEach((element) {
    if (element[4] == "BUY") {
      netTradedShares += int.parse(element[5]);
    } else if (element[4] == "SELL") {
      netTradedShares -= int.parse(element[5]);
    }
  });

  print("Net shares bought/sold by client(s): $netTradedShares shares");
}

import 'dart:io';

import 'total_scrips_traded.dart';

List<String> fileContent = [];

void main() async {
// Creates a file object.
  var bulkDealsFile = File("bulk.csv");

// Fetches & assign [List] of each lines to content.
  await bulkDealsFile.readAsLines().then((List<String> value) {
    fileContent = value;
  });

// Displays total number of scrips traded as on date.
  int numberOfScripsTraded = getTotalScripsTraded();
  print("Total number of scrips traded today: $numberOfScripsTraded");

// Displays all bulk deals.
  for (int i = 0; i < fileContent.length; i++) {
    print("${fileContent[i]}");
  }

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

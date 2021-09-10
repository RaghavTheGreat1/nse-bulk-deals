import 'dart:io';

import 'bulk_deals_by_stock_search.dart';
import 'total_bulk_deals_displayer.dart';
import 'total_scrips_traded.dart';

List<String> fileContent = [];

void main() async {
  Stopwatch stopwatch = new Stopwatch()..start();

// Creates a file object.
  var bulkDealsFile = File("bulk.csv");

// Fetches & assign [List] of each lines to content.
  await bulkDealsFile.readAsLines().then((List<String> value) {
    fileContent = value;
  });

// Displays total number of scrips traded as on date.
  int numberOfScripsTraded = getTotalScripsTraded();
  print("Total number of scrips traded today: $numberOfScripsTraded");

  print("Do you want to get all bulk deals?(Y/N)");
  String? allBulkDealRequired = stdin.readLineSync()?.toUpperCase();
  switch (allBulkDealRequired) {
    case "Y":
      totalBulkDealsDisplayer();
      break;

    case "N":
      bulkDealsByStock();
      break;

    default:
      print("Sorry, it's a wrong input.");
  }

  print('\nProgram executed in ${stopwatch.elapsed}');
}

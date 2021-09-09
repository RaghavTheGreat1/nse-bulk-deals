import 'dart:io';

// TODO: Number of scrips traded.
// TODO: List of scrips traded.
// TODO: Net shares traded in bulk deals overall.
// TODO: Net shares traded in bulk deals scripwise

void main() async {
// Creates a file object.
  var bulkDealsFile = File("bulk.csv");
  List<String> content = [];

// Fetches & assign [List] of each lines to content.
  await bulkDealsFile.readAsLines().then((List<String> value) {
    content = value;
  });

// Displays all bulk deals.
  for (int i = 0; i < content.length; i++) {
    print("${content[i]}");
  }

  print("Enter the Stock Symbol you want to search for: ");
  String? stockSearch = stdin.readLineSync();

  List scripTradedDetails = [];
  for (int j = 0; j < content.length; j++) {
    if (content[j].split(",")[1].contains(stockSearch.toString())) {
      scripTradedDetails.add(content[j].split(","));
      print(content[j]);
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

  print("Net BUY/SELL by clients: $netTradedShares");
}

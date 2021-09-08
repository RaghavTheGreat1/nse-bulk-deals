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
}

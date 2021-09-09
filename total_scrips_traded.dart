import 'main.dart';

int getTotalScripsTraded() {
  List<String> rawScripsList = fileContent;

  /// List of names of
  List<String> scripsTradedList = [];

  /// Count of number of scrips traded.
  int numberOfScripsTraded = 0;

  /// Dummy list which contains names of scrips traded. Dummy because this will
  /// contain repetitions of scrips name.
  List<String> scripsTradedFlag = [];

// Loop used for adding names of scrips traded to dummy list
  for (int i = 1; i < rawScripsList.length; i++) {
    List<String> scripDetailsList = rawScripsList[i].split(",");
    scripsTradedFlag.add(scripDetailsList[1]);
  }

  scripsTradedList = scripsTradedFlag.toSet().toList();
  numberOfScripsTraded = scripsTradedList.length;

  return numberOfScripsTraded;
}

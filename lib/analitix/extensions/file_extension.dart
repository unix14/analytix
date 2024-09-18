import 'dart:io';
import 'package:analitix/analitix/models/analytix_event.dart';
import 'package:flutter/foundation.dart';
import 'package:csv/csv.dart';

extension FileExtension on File {

  /// This function saves the analytics events into a CSV file
  Future<File?> exportToCsv(List<AnalytixEvent> events) async {
    // Convert the list of TroubleshootHistoryItem to a list of lists
    final rows = events.map((item) => [item.eventName, item.subEventName, item.parameters]).toList();

    // Convert the list of lists to a CSV string
    String csv = const ListToCsvConverter().convert(rows);

    // Write the CSV string to the file
    await writeAsString(csv);

    if(kDebugMode) {
      checkIfFileExist();
    }
    print("saveEventsIntoFile: File finished");
    return this;
  }

  /// This is a helper function to check if the file was created successfully
  Future<bool> checkIfFileExist() async {
    // Check if the file exists
    bool fileExists = await exists();
    if (fileExists) {
      print("File successfully created at: $path");
      // Read the file contents
      String contents = await readAsString();
      print("File contents: $contents");
      return true;
    } else {
      print("File not created");
      return false;
    }
  }
}

import 'dart:io';
import 'package:analitix/analitix/models/analytix_event.dart';
import 'package:path_provider/path_provider.dart';
import '../extensions/file_extension.dart';
import '../abstract/base_reporter.dart';

/// ExcelReporter class
/// This class is responsible for creating an excel file and exporting the events to it
/// It extends the BaseReporter class
class ExcelReporter extends BaseReporter {

  File? currentFile;

  @override
  void init() {
    // create the excel file
    _createExcelFile();
  }

  @override
  void logEvent(AnalytixEvent event) {
    print('ExcelReporter: logEvent: $event');
  }

  Future<File?> exportToFile(List<AnalytixEvent> events) async {
    print('ExcelReporter: getFile: Excel report generated');
    return await currentFile?.exportToCsv(events);
  }

  _createExcelFile() {
    Future.sync(() async {
      // Get the local path
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;

      // Get the current date and time
      final now = DateTime.now();

      // Format the date and time as a string
      final formattedDateTime = "${now.day}_${now.month}_${now.year}_${now.hour}_${now.minute}_${now.second}";

      // Create a new file with a unique name
      String filePath = '$path/CSV_$formattedDateTime.csv';
      print("ExcelReporter: Creating a file: $filePath");
      currentFile = File(filePath);
      print('ExcelReporter: Excel file created');
    });
  }
}